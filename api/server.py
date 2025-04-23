#!/usr/bin/env python3
"""
Tiny REST layer that exposes `log_insight`
so the React dashboard (or curl) can fetch AI root-cause analyses.
"""
import os
import json
import datetime as dt
import traceback
from decimal import Decimal
from uuid import UUID
from urllib.parse import unquote_plus

import psycopg2
import psycopg2.extras
from flask import Flask, request, Response, abort
from flask_cors import CORS

# ── env / PG helper ─────────────────────────────────────────────────────────
PG_DSN = os.getenv(
    "PG_DSN",
    "host=db port=5434 dbname=postgres user=postgres password=apidebugger",
)


def pg_conn():
    return psycopg2.connect(
        PG_DSN, cursor_factory=psycopg2.extras.RealDictCursor
    )


# ── custom JSON encoder (handles Decimal, UUID, datetime) ───────────────────
class BetterJSON(json.JSONEncoder):
    def default(self, o):  # noqa: D401
        if isinstance(o, (dt.datetime, dt.date)):
            return o.isoformat()
        if isinstance(o, Decimal):
            return float(o)
        if isinstance(o, UUID):
            return str(o)
        return super().default(o)


def json_response(obj, status=200):
    return Response(
        json.dumps(obj, cls=BetterJSON),
        status=status,
        mimetype="application/json",
    )


# ── Flask app ───────────────────────────────────────────────────────────────
app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})  # allow localhost:5173, etc.


@app.get("/healthz")
def healthz():
    return json_response({"ok": True})


@app.get("/insights")
def insights():
    try:
        # ── query params ────────────────────────────────────────────────────────
        raw = request.args.get("since", "86400")  # default: 24 h
        raw = unquote_plus(raw)                   # turn %20 → ' '
        since = f"{raw} seconds" if raw.isdigit() else raw

        try:
            limit = int(request.args.get("limit", "100"))
        except ValueError:
            abort(400, "'limit' must be an integer")

        sql = """
          SELECT i.id,
                 i.ts/1e6                  AS ts,
                 to_timestamp(i.ts/1e6)    AS ts_utc,
                 i.method, i.path, i.status,
                 i.root_cause, i.suggestion, i.confidence,
                 p.body as req_body,
                 NULL as req_headers,
                 NULL as res_body,
                 NULL as res_headers
            FROM log_insight i
            LEFT JOIN proxy_log p ON i.id = p.id
           WHERE i.ts > extract(epoch from (now() - interval %s)) * 1e6
           ORDER BY i.ts DESC
           LIMIT %s
        """

        # ── run query ───────────────────────────────────────────────────────────
        with pg_conn() as conn, conn.cursor() as cur:
            cur.execute(sql, (since, limit))
            rows = [dict(r) for r in cur.fetchall()]  # RealDictRow → plain dict

            # Process body fields after fetching
            for row in rows:
                if row['req_body']:
                    try:
                        if 'REQUEST:' in row['req_body']:
                            req_part = row['req_body'].split('REQUEST:\n')[1].split('\n\nRESPONSE:')[0]
                            res_part = row['req_body'].split('\n\nRESPONSE:\n')[1]
                            
                            # Extract headers and body from request
                            if 'Headers:' in req_part:
                                req_headers = req_part.split('Headers:\n')[1].split('\nBody:')[0]
                                row['req_headers'] = {'headers': req_headers}
                            
                            # Extract headers and body from response
                            if 'Headers:' in res_part:
                                res_headers = res_part.split('Headers:\n')[1].split('\nBody:')[0]
                                row['res_headers'] = {'headers': res_headers}
                                row['res_body'] = res_part.split('\nBody:')[1] if '\nBody:' in res_part else ''
                    except Exception as e:
                        app.logger.error(f"Error processing body for row {row['id']}: {str(e)}")
                        # Don't let body parsing errors break the whole response
                        continue

        return json_response(rows)
    except Exception as e:
        app.logger.error(f"Error in /insights: {str(e)}\n{traceback.format_exc()}")
        return json_response({"error": str(e)}, status=500)


# ── entry-point when run under `docker run …` ───────────────────────────────
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001, threaded=True)

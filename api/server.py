from flask import Flask, request, jsonify
from flask_cors import CORS
import os, psycopg2, psycopg2.extras, json, datetime

PG_DSN = os.environ["PG_DSN"]          # already in infra/.env

app = Flask(__name__)
CORS(app)                              # allow :5173 dev server

def rows(query, *params):
    with psycopg2.connect(PG_DSN, cursor_factory=psycopg2.extras.DictCursor) as conn:
        cur = conn.cursor()
        cur.execute(query, params)
        return [dict(r) for r in cur.fetchall()]

@app.get("/api/v1/insights")
def latest():
    # ?since=3600  (seconds)  default = 86400 (=24h)
    seconds = int(request.args.get("since", 86400))
    t0 = datetime.datetime.utcnow() - datetime.timedelta(seconds=seconds)
    data = rows("""
        SELECT * FROM log_insight
        WHERE ts >= %s
        ORDER BY ts DESC
        LIMIT 200
    """, t0)
    return jsonify(data)

@app.get("/healthz")
def health():
    return "ok", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

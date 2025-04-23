#!/usr/bin/env python3
import os, time, json, uuid, requests
import psycopg2, psycopg2.extras

PG_DSN    = os.environ["PG_DSN"]
AIP_URL   = os.environ["AIP_URL"]
AIP_TOKEN = os.environ["AIP_TOKEN"]

HEADERS = {
    "Authorization": f"Bearer {AIP_TOKEN}",
    "Content-Type":  "application/json"
}

BATCH = 25   # rows per pass
SLEEP = 5    # seconds between polls


def fetch_unseen(cur):
    cur.execute("""
        SELECT * FROM proxy_log
         WHERE status >= 400
           AND id NOT IN (SELECT id FROM log_insight)
         ORDER BY "timestamp"
         LIMIT %s
    """, (BATCH,))
    return cur.fetchall()


def call_aip(row):
    payload = {
        "parameters": {
            "method": row["method"],
            "path":   row["path"],
            "status": str(row["status"]),
            "body":   (row.get("body") or "")
        }
    }
    print("POST", json.dumps(payload), flush=True)
    res = requests.post(AIP_URL, json=payload, headers=HEADERS, timeout=10)
    res.raise_for_status()
    return res.json().get("value", {})


def once(cur, conn):
    rows = fetch_unseen(cur)
    if not rows:
        print("nothing new")
        return 0

    inserted = 0
    for r in rows:
        try:
            insight = call_aip(r)
        except Exception as e:
            print("worker error calling AIP:", e)
            continue

        cur.execute("""
            INSERT INTO log_insight(id, ts, method, path, status,
                                    root_cause, suggestion, confidence)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
            ON CONFLICT (id) DO NOTHING
        """, (
            r["id"], r["timestamp"], r["method"], r["path"], r["status"],
            insight.get("cause", "unknown"),
            insight.get("suggestion", ""),
            insight.get("confidence", 0.5)
        ))

        if cur.rowcount:
            inserted += 1

    conn.commit()
    time.sleep(0.2)          
    print(f"inserted {inserted} insight(s)")
    return inserted


def main():
        while True:
            try:
                conn = psycopg2.connect(PG_DSN,
                            cursor_factory=psycopg2.extras.DictCursor)
                print("✅ connected to db", flush=True)
                break
            except psycopg2.OperationalError:
                print("❗ db not ready, retrying in 2s…", flush=True)
                time.sleep(2)
        cur = conn.cursor()

        # ---- create log_insight on first run ---------------------------------
        cur.execute("""
            CREATE TABLE IF NOT EXISTS log_insight (
                id          BIGINT      PRIMARY KEY,
                ts          TIMESTAMPTZ NOT NULL,
                method      TEXT        NOT NULL,
                path        TEXT        NOT NULL,
                status      INT         NOT NULL,
                root_cause  TEXT,
                suggestion  TEXT,
                confidence  REAL        DEFAULT 0.5
            )
        """)
        conn.commit()
        # ----------------------------------------------------------------------

        while True:
            try:
                once(cur, conn)
            except Exception as e:
                print("worker error:", e)
                conn.rollback()
            time.sleep(SLEEP)


if __name__ == "__main__":
    main()

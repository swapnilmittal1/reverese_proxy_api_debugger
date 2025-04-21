CREATE TABLE IF NOT EXISTS proxy_log (
    id         SERIAL PRIMARY KEY,
    timestamp  BIGINT   NOT NULL,
    method     TEXT     NOT NULL,
    path       TEXT     NOT NULL,
    status     INTEGER  NOT NULL,
    body       TEXT
);

CREATE TABLE IF NOT EXISTS aip_proxy_log
    (LIKE proxy_log INCLUDING ALL);
ALTER TABLE aip_proxy_log
    ADD COLUMN IF NOT EXISTS aip_id UUID NULL;

CREATE OR REPLACE RULE mirror_to_aip AS
ON INSERT TO proxy_log
DO ALSO INSERT INTO aip_proxy_log VALUES (NEW.*);

CREATE TABLE IF NOT EXISTS log_insight (
    id          INTEGER PRIMARY KEY REFERENCES proxy_log(id),
    ts          BIGINT,
    method      TEXT,
    path        TEXT,
    status      INTEGER,
    root_cause  TEXT,
    suggestion  TEXT,
    confidence  REAL
);

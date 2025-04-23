#!/usr/bin/env bash

set -euo pipefail

# 1) Kill any standalone proxy you might have running
pkill -f "./build/proxy/proxy" 2>/dev/null || true

# 2) Go into your infra folder
cd infra

# 3) Tear down Docker (removes volumes too, so you start clean)
docker compose down -v --remove-orphans

# 4) Bring up all services, building from scratch
docker compose up -d --build db proxy api worker

# 5) Wait for Postgres to accept connections
echo -n "Waiting for Postgres… "
until docker compose exec -T db pg_isready -U postgres >/dev/null 2>&1; do
  sleep 1
  echo -n "."
done
echo " OK"

# 6) Install tables, mirror‐trigger and log_insight schema
docker compose exec -T db psql -U postgres <<'SQL'
BEGIN;

-- proxy_log comes from your init‑sql directory; now ensure the mirror table + trigger:
CREATE TABLE IF NOT EXISTS aip_proxy_log (
  LIKE proxy_log INCLUDING ALL,
  aip_id uuid
);

CREATE OR REPLACE FUNCTION mirror_to_aip() RETURNS trigger
  LANGUAGE plpgsql AS $$
BEGIN
  INSERT INTO aip_proxy_log (id, "timestamp", method, path, status, body)
    VALUES (NEW.id, NEW."timestamp", NEW.method, NEW.path, NEW.status, NEW.body);
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS mirror_proxy ON proxy_log;
CREATE TRIGGER mirror_proxy
  AFTER INSERT ON proxy_log
  FOR EACH ROW EXECUTE FUNCTION mirror_to_aip();

-- log_insight table (deferred FK back to proxy_log)
CREATE TABLE IF NOT EXISTS log_insight (
  id          BIGINT PRIMARY KEY
                REFERENCES proxy_log(id)
                DEFERRABLE INITIALLY DEFERRED,
  ts          BIGINT      NOT NULL,
  method      TEXT        NOT NULL,
  path        TEXT        NOT NULL,
  status      INT         NOT NULL,
  root_cause  TEXT,
  suggestion  TEXT,
  confidence  REAL        DEFAULT 0.5
);

COMMIT;
SQL

echo "Schema and triggers installed."

# 7) Final check
docker compose ps

echo
echo "✅  All services are up!"
echo "   • Proxy: http://localhost:8080"
echo "   • API:   http://localhost:5001"
echo
echo "Try for example:"
echo "  curl -i http://localhost:8080/does-not-exist   # → 404 + logs"
echo "  curl -i http://localhost:8080/v1/forecast?latitude=40&longitude=-74  # → 200"

#!/usr/bin/env bash
set -euo pipefail

echo "Waiting for Kafka Connect..."
until curl -fsS http://localhost:8083/connectors >/dev/null; do
  sleep 3
done

echo "Registering MySQL source connector..."
curl -i -X POST http://localhost:8083/connectors \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  --data @connectors/mysql-source.json

echo
echo "Registering PostgreSQL sink connector..."
curl -i -X POST http://localhost:8083/connectors \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  --data @connectors/postgres-sink.json

echo
echo "Current connectors:"
curl -s http://localhost:8083/connectors | jq .

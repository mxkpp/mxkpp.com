#!/bin/bash

set -euo pipefail

YML="docker-compose.yml"

docker compose -f "${YML}" down
rm -rf "www" && mkdir -m a=rwx "www"
docker compose -f "${YML}" build
docker compose -f "${YML}" up -d

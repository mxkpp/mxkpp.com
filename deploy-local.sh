#!/bin/bash

set -euo pipefail

YML="docker-compose.local.yml"

docker compose -f "${YML}" down
rm -rf "_site" && mkdir -m a=rwx "_site"
docker compose -f "${YML}" build
docker compose -f "${YML}" up

#!/bin/bash

set -euo pipefail

YML="docker-compose.yml"

docker compose -v -f "${YML}" down
rm -rf "www" && mkdir -m a=rwx "www"

# New release
docker compose -f "${YML}" build --no-cache

# # Hotfix
# docker compose -f "${YML}" build

# All
docker compose -f "${YML}" up -d

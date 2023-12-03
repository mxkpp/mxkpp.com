#!/bin/bash

set -euo pipefail

YML="docker-compose.yml"

docker compose -v -f "${YML}" down
rm -rf "www" && mkdir -m a=rwx "www"

# Initial standup or hotfix
docker compose -f "${YML}" build

# # New release
# docker compose -f "${YML}" build --no-cache

# All
docker compose -f "${YML}" up -d

#!/bin/bash

set -euo pipefail

YML="docker-compose.local.yml"

docker compose -v -f "${YML}" down
rm -rf "www" && mkdir -m a=rwx "www"

# Dev
docker compose -f "${YML}" build

# # Test Before Prod
# docker compose -f "${YML}" build --no-cache

# All
docker compose -f "${YML}" up

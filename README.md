## Building and Running on After Git Clone

1. `mv gs-creds.json.default gs-creds.json`
1. Edit gs-creds.json, or replace it with a symlink to another file on host
1. `mv .env.default .env`
1. Edit .env, or replace it with a symlink to another file on host
1. Choose deploy script: `deploy-local.sh` for development and `deploy.sh` for production. Review the deploy script
and choose nonstandard --no-cache option if needed.
1. Run deploy script: `deploy-local.sh` or `deploy.sh`

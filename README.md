## Building and Running on Localhost After Git Clone

1. `mv gs-creds.json.default gs-creds.json`
1. Edit gs-creds.json, or replace it with a symlink to another file on host
1. `mv .env.default .env`
1. Edit .env, or replace it with a symlink to another file on host
1. Review `deploy-local.sh` and adjust for --no-cache as needed
1. `./deploy-local.sh`

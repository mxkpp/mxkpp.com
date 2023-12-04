## Building and Running After Git Clone

1. `cp gs-creds.json.default gs-creds.json`
1. Edit `gs-creds.json`
1. `cp .env.default .env`
1. Edit `.env`
1. Choose deploy script: `deploy-local.sh` for development or `deploy.sh` for production. Review the deploy script which defaults to using build cache (does not include --no-cache by default).
1. Run deploy script: `deploy-local.sh` or `deploy.sh`

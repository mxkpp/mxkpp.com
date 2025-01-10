## Building and Running After Git Clone

1. `cp gs-creds.json.default gs-creds.json`
1. Edit `gs-creds.json`
1. `cp .env.default .env`
1. Edit `.env`
1. Choose deploy script: `deploy-local.sh` for development or `deploy.sh` for production. Review the deploy script which defaults to using build cache (does not include --no-cache by default).
1. Run deploy script: `deploy-local.sh` or `deploy.sh`

## Upgrading Jekyll version

1. Find the Dockerhub image tag of the jekyll version you wish to use
1. Edit the file [Dockerfile.jekyll](Dockerfile.jekyll) to use the right tag
1. Edit the file [Dockerfile.jekyll](Dockerfile.jekyll) (temporarily) to comment out the line that copies [Jekyll-source/Gemfile.lock](Jekyll-source/Gemfile.lock) into the image, so that it will re-create this file itself the next time it builds.
1. Rename the file [Jekyll-source/Gemfile.lock](Jekyll-source/Gemfile.lock) to `Jekyll-source/Gemfile.lock.old`
1. Edit the file [Jekyll-source/Gemfile](Jekyll-source/Gemfile) to use the right tag
1. Build the image locally and start the local server via `./deploy-local.sh` (this should create a new [Jekyll-source/Gemfile.lock](Jekyll-source/Gemfile.lock) file) and confirm that the app works locally (go to [http://localhost](http://localhost))
1. Edit the file [Dockerfile.jekyll](Dockerfile.jekyll) to re-enable the line that copies [Jekyll-source/Gemfile.lock](Jekyll-source/Gemfile.lock) into the image
1. Run `./deploy-local.sh` again and visit [http://localhost](http://localhost) again
1. Commit and push changes to `Dockerfile.jekyll`, `Gemfile`, and `Gemfile.lock`
1. Pull changes from the public server
1. Restart the public server and confirm that the live app works at [https://mxkpp.com](https://mxkpp.com)

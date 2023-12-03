#!/bin/bash

# Run from /app/Jekyll-source

set -eu

GS_LOCAL_ROOT=assets/gs

GS_DIR_URL=gs://${GS_BUCKET}/${GS_ASSETS_PREFIX}
GS_LOCAL_BUCKET_DIR=${GS_LOCAL_ROOT}/${GS_BUCKET}
GS_LOCAL_PREFIX_DIR=${GS_LOCAL_BUCKET_DIR}/${GS_ASSETS_PREFIX}


echo "Logging in to gcloud"
gcloud auth activate-service-account --key-file=/.secrets/gs-creds.json > /dev/null

echo "Testing bucket prefix access"
gsutil ls "${GS_DIR_URL}" > /dev/null

echo "Downloading gcloud data (gsutil rsync)"
mkdir -p "${GS_LOCAL_PREFIX_DIR}"
gsutil -m rsync -r "${GS_DIR_URL}" "${GS_LOCAL_PREFIX_DIR}"

# set owner and perms on downloaded gcloud data
chown -R ${GS_LOCAL_OWNER}:${GS_LOCAL_GROUP} "${GS_LOCAL_BUCKET_DIR}"
# recursively set file permissions to "-rw-r--r--" aka 644
chmod -R u=rw,g=r,o=r "${GS_LOCAL_BUCKET_DIR}"
# set dir permissions to "drwxr-xr-x" aka 755
chmod -R u+rwX,go+rX,go-w "${GS_LOCAL_BUCKET_DIR}"

# for every .png file in assets/images, create a 200x200 thumbnail of it in assets/images/thumbs
if ls assets/images/*.png 1> /dev/null 2>&1; then
    echo "Converting 'assets/images/*.png' to thumbnails"
    magick mogrify -thumbnail 200x200 -format png -path assets/images/thumbs/ assets/images/*.png
else
    echo echo "Not making thumbnails"
fi

echo "Building static website"
jekyll build --trace -d /app/www

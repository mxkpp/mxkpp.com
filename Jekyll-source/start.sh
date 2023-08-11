#!/bin/bash

set -eu

if ls assets/images/*.png 1> /dev/null 2>&1; then
    magick mogrify -thumbnail 200x200 -format png -path assets/images/thumbs/ assets/images/*.png
fi

jekyll build -d /app/www

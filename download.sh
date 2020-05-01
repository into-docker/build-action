#!/bin/sh -l

set -eu

VERSION="$1"
FILE="/dist/into-${VERSION}.zip"

if [ ! -f "$FILE" ]; then
    URL="https://github.com/into-docker/into-docker/releases/download/v${VERSION}/into-${VERSION}-linux-amd64-static.zip"
    wget -O "$FILE" "$URL"
fi
echo "$FILE"

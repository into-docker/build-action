#!/bin/sh -l

set -eu

VERSION="$1"

if [ -z "$VERSION" ]; then VERSION="${DEFAULT_VERSION:-1.0.0}"; fi

FILE="/dist/into-${VERSION}.zip"
URL="https://github.com/into-docker/into-docker/releases/download/v${VERSION}/into-${VERSION}-linux-amd64-static.zip"
wget -O "$FILE" "$URL"

echo "$FILE"

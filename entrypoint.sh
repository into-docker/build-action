#!/bin/sh -l

set -eu

VERSION="$1"
BUILDER="$2"
TAG="$3"
WORKPATH="$4"
CACHE="$5"
PROFILE="$6"

function opt() {
    local OPT="$1"
    local VALUE="$2"

    if [ ! -z "$VALUE" ]; then
        echo $OPT "$VALUE"
    fi
}

echo "--- Downloading and extracting CLI tool ..."
ZIP=$(/dist/download.sh "$VERSION")
unzip -d /dist "$ZIP"
chmod +x /dist/into
echo

echo "--- Building ..."
/dist/into -v build \
    --ci "github-actions" \
    --tag "$TAG" \
    $(opt "--cache" "$CACHE") \
    $(opt "--profile" "$PROFILE") \
    "$BUILDER" \
    "$GITHUB_WORKSPACE/${WORKPATH}"

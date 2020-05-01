#!/bin/sh -l

set -eu

DEFAULT_VERSION="$1"
VERSION="$2"
BUILDER="$3"
TAG="$4"
WORKPATH="$5"
CACHE="$6"
PROFILE="$7"

if [ -z "$VERSION" ]; then VERSION="$DEFAULT_VERSION"; fi

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

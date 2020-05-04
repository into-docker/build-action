#!/bin/sh -l

set -eu

VERSION="$1"
BUILDER="$2"
TAG="$3"
SOURCE_PATH="$4"
ARTIFACTS_PATH="$5"
CACHE_PATH="$6"
PROFILE="$7"

function opt() {
    local OPT="$1"
    local VALUE="$2"

    if [ ! -z "$VALUE" ]; then
        echo $OPT "$VALUE"
    fi
}

ZIP=""
if [ -z "$VERSION" ]; then
    echo "--- Extracting CLI tool"
    ZIP=$(ls /dist/into-*.zip)
else
    echo "--- Downloading and extracting CLI tool ..."
    ZIP=$(/dist/download.sh "$VERSION")
fi
unzip -d /dist "$ZIP"
chmod +x /dist/into
echo

echo "--- Building ..."
/dist/into -v build \
    --ci "github-actions" \
    $(opt "--tag" "$TAG") \
    $(opt "--cache" "$CACHE_PATH") \
    $(opt "--profile" "$PROFILE") \
    $(opt "--write-artifacts" "$ARTIFACTS_PATH") \
    "$BUILDER" \
    "$GITHUB_WORKSPACE/$SOURCE_PATH"

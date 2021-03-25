#!/bin/sh

set -eu
IMAGE="$1"

echo "--- Inspecting Image $IMAGE ..."
docker inspect "$IMAGE"

echo "--- Verifying Artifacts ..."
shift
for ARTIFACT in "$@"; do
    echo "  $ARTIFACT"
    test -f "$ARTIFACT"
    shift
done

echo "--- Running Image $IMAGE ..."
test "x$(docker run --rm "$IMAGE")" = "xOK"

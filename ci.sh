#!/usr/bin/env bash

set -e

echo "$GITHUB_TOKEN" | docker login ghcr.io -u $GITHUB_ACTOR --password-stdin

docker buildx build --platform linux/amd64,linux/arm64 \
   --tag ghcr.io/garrettkurth/flutter-slim:${FLUTTER_VERSION/+/-} \
   --tag ghcr.io/garrettkurth/flutter-slim:$DOCKER_TAG \
   --build-arg flutter_version=$FLUTTER_VERSION \
   sdk

if [ "$BRANCH" = "master" ]; then
    docker buildx build --platform linux/amd64,linux/arm64 --push \
       --tag ghcr.io/garrettkurth/flutter-slim:${FLUTTER_VERSION/+/-} \
       --tag ghcr.io/garrettkurth/flutter-slim:$DOCKER_TAG \
       --build-arg flutter_version=$FLUTTER_VERSION \
       sdk
fi

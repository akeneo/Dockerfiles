#!/usr/bin/env bash

set -euo pipefail

LATEST_PHP_VERSION=$1
LATEST_NODE_VERSION=$2

TAG_PREFIX="php-"

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

for IMAGE in ${IMAGES}; do
    IMAGE_TAG=${VERSION}
    if [[ "php" != "$IMAGE" && "node" != "$IMAGE" ]]; then
        IMAGE_TAG=${TAG_PREFIX}${VERSION}
    fi

    docker push akeneo/${IMAGE}:${IMAGE_TAG}

    if [[ "php" == "$IMAGE" || "fpm" == "$IMAGE" ] && [ "$LATEST_PHP_VERSION" == "$VERSION" ]]; then
        docker tag akeneo/${IMAGE}:${IMAGE_TAG} akeneo/${IMAGE}:latest
        docker push akeneo/${IMAGE}:latest
    fi

    if [[ "node" == "$IMAGE" && "$LATEST_NODE_VERSION" == "$VERSION" ]]; then
        docker tag akeneo/${IMAGE}:${IMAGE_TAG} akeneo/${IMAGE}:latest
        docker push akeneo/${IMAGE}:latest
    fi
done

#!/usr/bin/env bash

set -euo pipefail

TAG_PREFIX="php-"

PROJECT_DIR=$(dirname $(readlink -f $0))/../

for IMAGE in ${IMAGES}; do
    IMAGE_PATH=${PROJECT_DIR}/${IMAGE}/${VERSION}

    IMAGE_TAG=${VERSION}
    if [[ "php" != "$IMAGE" && "node" != "$IMAGE" ]]; then
        IMAGE_TAG=${TAG_PREFIX}${VERSION}
    fi

    docker build -t akeneo/${IMAGE}:${IMAGE_TAG} ${IMAGE_PATH}
done

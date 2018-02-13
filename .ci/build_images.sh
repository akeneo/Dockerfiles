#!/usr/bin/env bash

set -euo pipefail

IMAGES="php fpm apache-php"
TAG_PREFIX="php-"

PROJECT_DIR=$(dirname $(readlink -f $0))/../

for IMAGE in ${IMAGES}; do
    IMAGE_PATH=${PROJECT_DIR}/${IMAGE}/${PHP_VERSION}

    IMAGE_TAG=${PHP_VERSION}
    if [ "php" != "$IMAGE" ]; then
        IMAGE_TAG=${TAG_PREFIX}${PHP_VERSION}
    fi

    docker build -t akeneo/${IMAGE}:${IMAGE_TAG} ${IMAGE_PATH}
done

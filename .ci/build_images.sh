#!/usr/bin/env bash

set -euo pipefail

IMAGES="php fpm apache-php"
TAG_PREFIX="php-"
LATEST_PHP_VERSION="7.1"

PROJECT_DIR=$(dirname $(readlink -f $0))/../

for IMAGE in ${IMAGES}; do
    IMAGE_PATH=${PROJECT_DIR}/${IMAGE}
    if [ "$PHP_VERSION" != "$LATEST_PHP_VERSION" ]; then
        IMAGE_PATH=${IMAGE_PATH}/${PHP_VERSION}
    fi

    IMAGE_TAG=${PHP_VERSION}
    if [ "php" != "$IMAGE" ]; then
        IMAGE_TAG=${TAG_PREFIX}${PHP_VERSION}
    fi

    docker build -t akeneo/${IMAGE}:${IMAGE_TAG} ${IMAGE_PATH}
done

#!/usr/bin/env bash

set -euo pipefail

IMAGES="php fpm apache-php"
TAG_PREFIX="php-"
LATEST_PHP_VERSION="7.1"
SCRIPT_DIR=$(dirname $(realpath $0))

for IMAGE in ${IMAGES}; do
    IMAGE_PATH=${SCRIPT_DIR}/../${IMAGE}
    if [ "PHP_VERSION" != "$LATEST_PHP_VERSION" ]; then
        IMAGE_PATH=${SCRIPT_DIR}/../${IMAGE}/${PHP_VERSION}
    fi

    IMAGE_TAG=${TAG_PREFIX}${PHP_VERSION}
    if [ "php" == "$IMAGE" ]; then
        IMAGE_TAG=${PHP_VERSION}
    fi

    cd ${IMAGE_PATH}
    docker build -t akeneo/${IMAGE}:${IMAGE_TAG} .
done

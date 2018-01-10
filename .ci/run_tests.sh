#!/usr/bin/env bash

DID_FAIL=0

set -xeuo pipefail

IMAGES="php fpm apache-php"
TAG_PREFIX="php-"
SCRIPT_DIR=$(dirname $(realpath $0))

for IMAGE in ${IMAGES}; do
    IMAGE_TAG=${TAG_PREFIX}${PHP_VERSION}
    if [ "php" == "$IMAGE" ]; then
        IMAGE_TAG=${PHP_VERSION}
    fi

    echo "Run tests for akeneo/$IMAGE:$IMAGE_TAG image"

    bash ${SCRIPT_DIR}/../tests/${IMAGE}/run_image_tests.sh ${IMAGE_TAG} || DID_FAIL=1
done

test "0" -ne "$DID_FAIL" && exit 1

exit 0

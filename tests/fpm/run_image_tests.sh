#!/usr/bin/env bash

set -euo pipefail

DID_FAIL=0
IMAGE_TAG=$1

CURRENT_DIR=$(dirname $(readlink -f $0))

docker run -d --name akeneo-fpm-${IMAGE_TAG} -u docker -v ${CURRENT_DIR}:${CURRENT_DIR} akeneo/fpm:${IMAGE_TAG}

for TEST in $(ls -1 ${CURRENT_DIR}/common/*.sh 2> /dev/null || true); do
    docker exec akeneo-fpm-${IMAGE_TAG} bash ${TEST} || DID_FAIL=1
done

for TEST in $(ls -1 ${CURRENT_DIR}/${IMAGE_TAG}/*.sh 2> /dev/null || true); do
    docker exec akeneo-fpm-${IMAGE_TAG} bash ${TEST} || DID_FAIL=1
done

docker rm -f -v akeneo-fpm-${IMAGE_TAG}

test "0" -ne "$DID_FAIL" && exit 1

exit 0

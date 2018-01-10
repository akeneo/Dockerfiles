#!/usr/bin/env bash

DID_FAIL=0

set -euo pipefail

IMAGE_TAG=$1
SCRIPT_DIR=$(dirname $(realpath $0))

docker run -d --name akeneo-fpm-${IMAGE_TAG} -u docker -v ${SCRIPT_DIR}:${SCRIPT_DIR} akeneo/fpm:${IMAGE_TAG}

for TEST in ${SCRIPT_DIR}/common/*.sh; do
    test -f "$TEST" || continue
    docker exec akeneo-fpm-${IMAGE_TAG} bash ${TEST} || DID_FAIL=1
done

for TEST in ${SCRIPT_DIR}/${IMAGE_TAG}/*.sh; do
    test -f "$TEST" || continue
    docker exec akeneo-fpm-${IMAGE_TAG} bash ${TEST} || DID_FAIL=1
done

docker rm -f -v akeneo-fpm-${IMAGE_TAG}

test "0" -ne "$DID_FAIL" && exit 1

exit 0

#!/usr/bin/env bash

set -euo pipefail

DID_FAIL=0
IMAGE_TAG=$1

CURRENT_DIR=$(dirname $(readlink -f $0))

for TEST in $(ls -1 ${CURRENT_DIR}/common/*.sh 2> /dev/null || true); do
    docker run -i -t --rm -u docker -v ${TEST}:/home/docker/test.sh akeneo/php:${IMAGE_TAG} bash test.sh || DID_FAIL=1
done

for TEST in $(ls -1 ${CURRENT_DIR}/${IMAGE_TAG}/*.sh 2> /dev/null || true); do
    docker run -i -t --rm -u docker -v ${TEST}:/home/docker/test.sh akeneo/php:${IMAGE_TAG} bash test.sh || DID_FAIL=1
done

test "0" -ne "$DID_FAIL" && exit 1

exit 0

#!/usr/bin/env bash

DID_FAIL=0

set -euo pipefail

IMAGE_TAG=$1
SCRIPT_DIR=$(dirname $(realpath $0))

for TEST in ${SCRIPT_DIR}/common/*.sh; do
    test -f "$TEST" || continue
    docker run -i -t --rm -u docker -v ${TEST}:/home/docker/test.sh akeneo/php:${IMAGE_TAG} bash test.sh || DID_FAIL=1
done

for TEST in ${SCRIPT_DIR}/${IMAGE_TAG}/*.sh; do
    test -f "$TEST" || continue
    docker run -i -t --rm -u docker -v ${TEST}:/home/docker/test.sh akeneo/php:${IMAGE_TAG} bash test.sh || DID_FAIL=1
done

test "0" -ne "$DID_FAIL" && exit 1

exit 0

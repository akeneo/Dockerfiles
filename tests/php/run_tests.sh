#!/usr/bin/env bash

set -euo pipefail

tag=$1
didFail=0
cwd=$(pwd)

if test "$(ls ${cwd}/tests/php/common | grep .sh)"; then
    for test in ${cwd}/tests/php/common/*.sh; do
        docker run -i -t --rm -u docker -v ${test}:/home/docker/test.sh akeneo/php:${tag} bash test.sh

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

if test "$(ls ${cwd}/tests/php/${tag} | grep .sh)"; then
    for test in ${cwd}/tests/php/${tag}/*.sh; do
        docker run -i -t --rm -u docker -v ${test}:/home/docker/test.sh akeneo/php:${tag} bash test.sh

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

test ${didFail} -eq '0'

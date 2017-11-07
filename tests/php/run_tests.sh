#!/usr/bin/env bash

tag=$1
didFail=0
cwd=$(pwd)

if test "$(ls ${cwd}/tests/php/common | grep .sh)"; then
    echo "Run common tests on image akeneo/php:${tag}"

    for test in ${cwd}/tests/php/common/*.sh; do
        docker run -i -t --rm -u docker -v ${test}:/home/docker/test.sh akeneo/php:${tag} sh test.sh

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

if test "$(ls ${cwd}/tests/php/${tag} | grep .sh)"; then
    echo "Run tag specific tests on image akeneo/php:${tag}"

    for test in ${cwd}/tests/php/${tag}/*.sh; do
        docker run -i -t --rm -u docker -v ${test}:/home/docker/test.sh akeneo/php:${tag} sh test.sh

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

if [ "$didFail" -gt 0 ]; then
    exit 1
fi

exit 0

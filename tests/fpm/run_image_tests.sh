#!/usr/bin/env bash

set -euo pipefail

tag=$1
didFail=0
cwd=$(pwd)

docker run -d --name akeneo-fpm-${tag} -u docker -v ${cwd}/tests/fpm:${cwd}/tests/fpm akeneo/fpm:${tag}

if test "$(ls ${cwd}/tests/fpm/common | grep .sh)"; then
    for test in ${cwd}/tests/fpm/common/*.sh; do
        docker exec akeneo-fpm-${tag} bash ${test}

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

if test "$(ls ${cwd}/tests/fpm/${tag} | grep .sh)"; then
    for test in ${cwd}/tests/fpm/${tag}/*.sh; do
        docker exec akeneo-fpm-${tag} bash ${test}

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

docker rm -f -v akeneo-fpm-${tag}

test ${didFail} -eq '0'

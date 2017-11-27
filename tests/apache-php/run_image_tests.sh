#!/usr/bin/env bash

set -euo pipefail

tag=$1
didFail=0
cwd=$(pwd)

docker run -d --name akeneo-apache-php-${tag} -u docker -v ${cwd}/tests/apache-php:${cwd}/tests/apache-php akeneo/apache-php:${tag}

if test "$(ls ${cwd}/tests/apache-php/common | grep .sh)"; then
    for test in ${cwd}/tests/apache-php/common/*.sh; do
        docker exec akeneo-apache-php-${tag} bash ${test}

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

if test "$(ls ${cwd}/tests/apache-php/${tag} | grep .sh)"; then
    for test in ${cwd}/tests/apache-php/${tag}/*.sh; do
        docker exec akeneo-apache-php-${tag} bash ${test}

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

docker rm -f -v akeneo-apache-php-${tag}

test ${didFail} -eq '0'

#!/usr/bin/env bash

tag=$1
didFail=0
cwd=$(pwd)

docker run -d --name akeneo-apache-php-${tag} -u docker -v ${cwd}/tests/apache-php:${cwd}/tests/apache-php akeneo/apache-php:${tag}

if test "$(ls ${cwd}/tests/apache-php/common | grep .sh)"; then
    echo "Run common tests on image akeneo/apache-php:${tag}"

    for test in ${cwd}/tests/apache-php/common/*.sh; do
        docker exec akeneo-apache-php-${tag} sh ${test}

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

if test "$(ls ${cwd}/tests/apache-php/${tag} | grep .sh)"; then
    echo "Run tag specific tests on image akeneo/apache-php:${tag}"

    for test in ${cwd}/tests/apache-php/${tag}/*.sh; do
        docker exec akeneo-apache-php-${tag} sh ${test}

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

docker rm -f -v akeneo-apache-php-${tag}

if [ "$didFail" -gt 0 ]; then
    exit 1
fi

exit 0

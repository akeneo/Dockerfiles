#!/usr/bin/env bash

tag=$1
didFail=0
cwd=$(pwd)

docker run -d --name akeneo-fpm-${tag} -u docker -v ${cwd}/tests/fpm:${cwd}/tests/fpm akeneo/fpm:${tag}

if test "$(ls ${cwd}/tests/fpm/common | grep .sh)"; then
    echo "Run common tests on image akeneo/fpm:${tag}"

    for test in ${cwd}/tests/fpm/common/*.sh; do
        docker exec akeneo-fpm-${tag} sh ${test}

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

if test "$(ls ${cwd}/tests/fpm/${tag} | grep .sh)"; then
    echo "Run tag specific tests on image akeneo/fpm:${tag}"

    for test in ${cwd}/tests/fpm/${tag}/*.sh; do
        docker exec akeneo-fpm-${tag} sh ${test}

        testOutput=$?
        didFail=$((didFail + testOutput))
    done
fi

docker rm -f -v akeneo-fpm-${tag}

if [ "$didFail" -gt 0 ]; then
    exit 1
fi

exit 0

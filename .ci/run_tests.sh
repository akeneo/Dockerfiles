#!/usr/bin/env bash

images=("php" "fpm" "apache-php")
tagPrefix=("" "php-" "php-")

didFail=1

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ )); do
    didFail=0

    imageTag=${tagPrefix[i]}${TAG}

    inspect=`docker inspect akeneo/${images[i]}:${imageTag}`

    if [ "$inspect" == "[]" ]; then
        echo "akeneo/${images[i]}:${imageTag} image does not exist!"
        exit 1
    fi

    echo "Run tests for akeneo/${images[i]}:${imageTag} image"

    sh ${cwd}/tests/${images[i]}/run_tests.sh ${imageTag}

    testsOutput=$?
    if [ "$testsOutput" != 0 ]; then
        testsOutput=1
    fi

    didFail=$((didFail + testsOutput))
done

if [ "$didFail" -gt 0 ]; then
    exit 1
fi

exit 0

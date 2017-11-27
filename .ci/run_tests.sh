#!/usr/bin/env bash

set -euo pipefail

images=("php" "fpm" "apache-php")
tagPrefix=("" "php-" "php-")

didFail=1

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ )); do
    didFail=0
    imageTag=${tagPrefix[i]}${TAG}

    echo "Run tests for akeneo/${images[i]}:${imageTag} image"

    bash ${cwd}/tests/${images[i]}/run_image_tests.sh ${imageTag}

    testsOutput=$?
    didFail=$((didFail + testsOutput))
done

test ${didFail} -eq '0'

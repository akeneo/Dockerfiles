#!/usr/bin/env bash

set -euo pipefail

images=("php" "fpm" "apache-php")
tagPrefix=("" "php-" "php-")
latestTag="7.1"

scriptFailed=1
inspectFailed=0

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ )); do
    if [ "$TAG" == "$latestTag" ]; then
        path=${cwd}/${images[i]}
    else
        path=${cwd}/${images[i]}/${TAG}
    fi

    imageTag=${tagPrefix[i]}${TAG}

    cd ${path}
    docker build -t akeneo/${images[i]}:${imageTag} .
done

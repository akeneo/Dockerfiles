#!/usr/bin/env bash

images=("php" "fpm" "apache-php" "akeneo-fpm")
versions=("7.1" "7.1" "php-7.1" "php-7.1")

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ ));
do
    cd ${cwd}/${images[i]}
    docker build -t akeneo/${images[i]}:${versions[i]} .
done

#!/usr/bin/env bash

images=("php" "fpm" "apache-php")
versions=("7.0" "7.0" "php-7.0")

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ ));
do
    cd ${cwd}/${images[i]}
    docker build -t carcel/${images[i]}:${versions[i]} .
done

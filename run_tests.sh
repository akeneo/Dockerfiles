#!/usr/bin/env bash

images=("php" "fpm" "apache-php" "akeneo-apache")
versions=("5.6" "5.6" "php-5.6" "php-5.6")

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ ));
do
    cd ${cwd}/${images[i]}
    docker build -t akeneo/${images[i]}:${versions[i]} .
done

#!/usr/bin/env bash

didFail=0
images=("php" "fpm" "apache-php")

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ ));
do
    cd ${cwd}/${images[i]}
    docker build -t akeneo/${images[i]} .

    if ! docker inspect akeneo/${images[i]} &> /dev/null; then
        echo $'\timage does not exist!'
        didFail=1
        continue
    fi
done

exit ${didFail}

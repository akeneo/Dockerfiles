#!/usr/bin/env bash

didFail=1
images=("php" "fpm" "apache-php")
latestTag=$1

cwd=$(pwd)
for (( i=0; i<${#images[@]}; i++ ));
do
    if [ "$TAG" == "$latestTag" ]; then
        path=${cwd}/${images[i]}
    else
        path=${cwd}/${images[i]}/${TAG}
    fi

    cd ${path}
    docker build -t akeneo/${images[i]}:${TAG} .

    if docker inspect akeneo/${images[i]}:${TAG} &> /dev/null; then
        didFail=0
        continue
    else
        echo "akeneo/${images[i]}:${TAG} image does not exist!"
        didFail=1
        continue
    fi
done

exit ${didFail}

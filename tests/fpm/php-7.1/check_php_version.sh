#!/usr/bin/env bash

echo "PHP FPM version should be 7.1"

version=`ps aux | grep "[p]hp-fpm7.1"`

if [ ! "$version" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

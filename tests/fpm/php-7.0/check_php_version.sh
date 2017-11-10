#!/usr/bin/env bash

echo "PHP FPM version should be 7.0"

version=`ps aux | grep "[p]hp-fpm7.0"`

if [ ! "$version" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

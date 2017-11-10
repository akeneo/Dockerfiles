#!/usr/bin/env bash

echo "PHP FPM version should be 5"

version=`ps aux | grep "[p]hp5-fpm"`

if [ ! "$version" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

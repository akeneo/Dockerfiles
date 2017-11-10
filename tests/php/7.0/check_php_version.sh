#!/usr/bin/env bash

echo "PHP version should be 7.0"

version=`php -v | grep "^PHP 7.0"`

if [ ! "$version" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

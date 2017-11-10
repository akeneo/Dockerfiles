#!/usr/bin/env bash

echo "PHP version should be 7.1"

version=`php -v | grep "^PHP 7.1"`

if [ ! "$version" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

#!/usr/bin/env bash

echo "PHP version should be 5.6"

version=`php -v | grep "^PHP 5.6"`

if [ ! "$version" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

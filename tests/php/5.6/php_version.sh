#!/usr/bin/env bash

echo "PHP version should be 5.6"

VERSION=$(php -v | grep "^PHP 5.6")

if [ -z "$VERSION" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

#!/usr/bin/env bash

echo "PHP FPM version should be 5"

VERSION=$(ps aux | grep "[p]hp5-fpm")

if [ -z "$VERSION" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

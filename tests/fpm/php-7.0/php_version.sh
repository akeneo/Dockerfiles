#!/usr/bin/env bash

echo "PHP FPM version should be 7.0"

VERSION=$(ps aux | grep "[p]hp-fpm7.0")

if [ -z "$VERSION" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

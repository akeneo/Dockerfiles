#!/usr/bin/env bash

echo "PHP FPM version should be 7.2"

VERSION=$(ps aux | grep "[p]hp-fpm: master process (/etc/php/7.2/fpm/php-fpm.conf)")

if [ -z "$VERSION" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

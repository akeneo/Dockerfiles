#!/usr/bin/env bash

echo "Default timezone should be UTC"

DATETIME_ZONE=$(php -i | grep date.timezone)

if [ "date.timezone => UTC => UTC" != "$DATETIME_ZONE" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

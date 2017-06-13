#!/usr/bin/env bash

echo "FPM should run with UID 1000"

RESULT=$(ps aux | grep "[p]hp-fpm: pool" | cut -c1-4 | uniq)

if [ "$RESULT" != "1000" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

#!/usr/bin/env bash

echo "Maximum amount of memory a script may consume should be 2 gigabytes"

MEMORY_LIMIT=$(php -i | grep memory_limit)

if [ "memory_limit => 2G => 2G" != "$MEMORY_LIMIT" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

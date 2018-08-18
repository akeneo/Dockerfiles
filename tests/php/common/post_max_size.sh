#!/usr/bin/env bash

echo "Maximum size of POST data that PHP will accept should be 64 megabytes"

POST_MAX_SIZE=$(php -i | grep post_max_size)

if [ "post_max_size => 64M => 64M" != "$POST_MAX_SIZE" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

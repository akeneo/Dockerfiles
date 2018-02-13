#!/usr/bin/env bash

echo "Maximum size of POST data that PHP will accept should be 20 megabytes"

POST_MAX_SIZE=$(php -i | grep post_max_size)

if [ "post_max_size => 20M => 20M" != "$POST_MAX_SIZE" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

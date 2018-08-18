#!/usr/bin/env bash

echo "Maximum allowed size for uploaded files should be 32 megabytes"

UPLOAD_MAX_FILE_SIZE=$(php -i | grep upload_max_filesize)

if [ "upload_max_filesize => 32M => 32M" != "$UPLOAD_MAX_FILE_SIZE" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

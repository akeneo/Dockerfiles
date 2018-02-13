#!/usr/bin/env bash

echo "Maximum allowed size for uploaded files should be 20 megabytes"

UPLOAD_MAX_FILE_SIZE=$(php -i | grep upload_max_filesize)

if [ "upload_max_filesize => 20M => 20M" != "$UPLOAD_MAX_FILE_SIZE" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

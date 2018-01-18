#!/usr/bin/env bash

echo "PHP should output errors on STDOUT"

DISPLAY_ERRORS=$(php -i | grep display_errors)

if [ "display_errors => STDOUT => STDOUT" != "$DISPLAY_ERRORS" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

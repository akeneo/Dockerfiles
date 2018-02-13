#!/usr/bin/env bash

echo "All errors and warnings should be reported"

ERROR_REPORTING=$(php -i | grep error_reporting)

if [ "error_reporting => 32767 => 32767" != "$ERROR_REPORTING" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

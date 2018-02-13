#!/usr/bin/env bash

echo "Apache PHP module version should be 5"

VERSION=$(apache2ctl -M | grep "[p]hp5_module")

if [ -z "$VERSION" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

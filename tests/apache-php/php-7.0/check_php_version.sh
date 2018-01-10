#!/usr/bin/env bash

echo "Apache PHP module version should be 7"

VERSION=$(apache2ctl -M | grep "[p]hp7_module")

if [ -z "$VERSION" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

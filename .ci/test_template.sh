#!/usr/bin/env bash

echo "Here is the description of your test"

RESULT=$(echo "whatever you want to do")

if [ "$RESULT" != "The expected result" ]; then
    echo "Failure"
    exit 1
fi

echo "Success"
exit 0

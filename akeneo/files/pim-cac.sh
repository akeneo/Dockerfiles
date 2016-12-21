#!/bin/bash

echo "Clean cache folder"
rm -rf app/cache/prod
rm -rf app/cache/dev

app/console ca:c -e=prod
app/console ca:c

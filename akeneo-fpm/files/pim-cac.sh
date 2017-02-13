#!/bin/bash

echo "Clean cache folder"
rm -rf app/cache/*

app/console ca:c -e=prod
app/console ca:c -e=behat
app/console ca:c

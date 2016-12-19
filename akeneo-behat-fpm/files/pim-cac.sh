#!/bin/bash

echo "Clean cache folder"
rm -rf app/cache/*

echo "Symfony cache regeneration"
app/console ca:c -e=behat

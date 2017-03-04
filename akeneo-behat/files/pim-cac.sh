#!/bin/bash

echo "Clean cache folder"
rm -rf app/cache/behat
rm -rf app/cache/test

echo "Symfony cache regeneration"
app/console ca:c -e=behat
app/console ca:c -e=test

#!/bin/bash

echo "Clean cache folder"
rm -rf app/cache/behat

echo "Symfony cache regeneration"
app/console ca:c -e=behat

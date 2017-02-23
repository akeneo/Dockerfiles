#!/bin/bash

echo "Clean previous assets"
rm -rf app/cache/behat
rm -rf web/bundles/*
rm -rf web/css/*
rm -rf web/js/*

echo "Initialize assets"
app/console -e=behat ca:c

app/console -e=behat oro:requirejs:generate-config
app/console -e=behat pim:in:ass
app/console -e=behat asset:install --symlink

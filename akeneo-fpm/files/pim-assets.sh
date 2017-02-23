#!/bin/bash

echo "Clean previous assets"
rm -rf app/cache/*
rm -rf web/bundles/*
rm -rf web/css/*
rm -rf web/js/*

echo "Initialize assets"
app/console ca:c -e=prod
app/console ca:c -e=behat
app/console ca:c

app/console -e=prod oro:requirejs:generate-config
app/console -e=prod pim:in:ass
app/console -e=prod asset:install --symlink

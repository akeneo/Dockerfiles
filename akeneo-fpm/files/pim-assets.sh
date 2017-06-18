#!/bin/bash

echo "Clean previous assets"
rm -rf app/cache/*
rm -rf web/bundles/*
rm -rf web/css/*
rm -rf web/js/*

echo "Initialize assets"
app/console ca:c -e=prod

app/console -e=prod pim:installer:assets
app/console -e=prod assets:install --symlink

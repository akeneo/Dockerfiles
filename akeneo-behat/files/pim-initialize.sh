#!/bin/bash

echo "Clean the install"
rm -rf app/archive/*
rm -rf app/cache/*
rm -rf app/file_storage/*
rm -rf app/logs/*
rm -rf web/bundles/*
rm -rf web/css/*
rm -rf web/js/*
rm -rf web/media/*

echo "Initialize the PIM"
app/console -e=behat ca:c

app/console -e=behat oro:requirejs:generate-config
app/console -e=behat pim:install --force
app/console -e=behat asset:install --symlink

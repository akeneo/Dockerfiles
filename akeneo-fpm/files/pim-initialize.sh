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
app/console ca:c -e=prod
app/console ca:c -e=behat
app/console ca:c

app/console -e=prod oro:requirejs:generate-config
app/console -e=prod pim:install --force
app/console -e=behat pim:install --force
app/console -e=prod asset:install --symlink

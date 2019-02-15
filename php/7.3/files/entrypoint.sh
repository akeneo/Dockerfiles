#!/bin/bash
set -e

XDEBUG_PATH="/etc/php/7.3/mods-available/xdebug.ini"

function execAsRoot {
    sudo bash -c "$1"
}

function writeXdebugSetting {
    execAsRoot "echo $1 >> ${XDEBUG_PATH}"
}

# checkOrWrite xdebugKey defaultValue providedValue
function checkOrWriteXdebugSetting {
   if [ -z "$3" ]; then
       writeXdebugSetting "${1}=${2}"
   else
       writeXdebugSetting "${1}=${3}"
   fi
}

writeXdebugSetting "xdebug.remote_enable=1"
writeXdebugSetting "xdebug.max_nesting_level=500"
writeXdebugSetting "xdebug.default_enable=1"

checkOrWriteXdebugSetting "xdebug.idekey" "XDEBUG_IDE_KEY" "${PHP_XDEBUG_IDE_KEY}"

if [ -z "${PHP_XDEBUG_REMOTE_HOST}" ]; then
    writeXdebugSetting "xdebug.remote_connect_back=1"
else
    writeXdebugSetting "xdebug.remote_host=${PHP_XDEBUG_REMOTE_HOST}"
fi

if [ ! -z "${PHP_XDEBUG_ENABLED}" ]; then
    if [ "${PHP_XDEBUG_ENABLED}" == "1" ]; then
        execAsRoot "phpenmod xdebug"
    elif [ "${PHP_XDEBUG_ENABLED}" == "0" ]; then
        execAsRoot "phpdismod xdebug"
    fi
else
    execAsRoot "phpdismod xdebug"
fi

eval "${@}"

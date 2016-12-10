#!/bin/bash
set -e

XDEBUG_PATH="/etc/php5/mods-available/xdebug.ini"

function execAsRoot {
    gosu root bash -c "$1"
}

function writeXdebugSetting {
    execAsRoot "echo $1 >> ${XDEBUG_PATH}"
}

# checkOrWrite xdebugKey defaultValue providedValue
function checkOrWrite {
   if [ -z "$3" ]; then
       writeXdebugSetting "${1}=${2}"
   else
       writeXdebugSetting "${1}=${3}"
   fi
}

writeXdebugSetting "xdebug.remote_enable=1"
writeXdebugSetting "xdebug.max_nesting_level=500"

checkOrWrite "xdebug.idekey" "XDEBUG_IDE_KEY" "${PHP_XDEBUG_IDE_KEY}"
checkOrWrite "xdebug.default_enable" "1" "${PHP_XDEBUG_DEFAULT_ENABLE}"

if [ -z "${PHP_XDEBUG_REMOTE_HOST}" ]; then
    writeXdebugSetting "xdebug.remote_connect_back=1"
else
    writeXdebugSetting "xdebug.remote_host=${PHP_XDEBUG_REMOTE_HOST}"
fi

execAsRoot "php5enmod xdebug"

eval "${@}"

#!/bin/bash
set -e

XDEBUG_PATH="/etc/php/7.2/mods-available/xdebug.ini"

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

writeXdebugSetting "xdebug.max_nesting_level=500"
writeXdebugSetting "xdebug.start_with_request=yes"
writeXdebugSetting "xdebug.mode=debug"

checkOrWriteXdebugSetting "xdebug.idekey" "XDEBUG_IDE_KEY" "${PHP_XDEBUG_IDE_KEY}"

if [ -z "${PHP_XDEBUG_REMOTE_HOST}" ]; then
    writeXdebugSetting "xdebug.discover_client_host=1"
else
    writeXdebugSetting "xdebug.client_host=${PHP_XDEBUG_REMOTE_HOST}"
fi

if [[ "${PHP_XDEBUG_ENABLED}" == "1" ]]; then
    execAsRoot "phpenmod xdebug"
else
    execAsRoot "phpdismod xdebug"
fi

exec "${@}"

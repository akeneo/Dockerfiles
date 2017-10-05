#!/bin/bash

function monit {
    (while true; do if [[ -f "/tmp/pod/main-terminated" ]]; then killall mysqld | true & break ; fi; sleep 1; done) &
    MYSQLPID=$(pgrep -o -x mysqld)
#    wait $MYSQLPID
    if [[ -f "/tmp/pod/main-terminated" ]]; then exit 0; fi
}

monit

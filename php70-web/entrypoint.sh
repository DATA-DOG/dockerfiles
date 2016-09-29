#!/bin/bash

if [ -f /init.sh ]; then
    sleep 5 && echo "[info] Running /init.sh script" && sh /init.sh &
fi

if [ "$1" == "start" ]; then
    exec /usr/bin/supervisord -c "/etc/supervisord.conf"
else
    echo "Run: $@"
    exec "$@"
fi

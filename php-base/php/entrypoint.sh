#!/bin/bash

if [ "$1" == "fpm" ]; then
    if [ "$XDEBUG" != "" ]; then
        PHP_ARGS="$PHP_ARGS -d xdebug.remote_enable=on"
        if [ "$XDEBUG_HOST" == "" ]; then
            XDEBUG_HOST="172.17.0.1"
        fi
    fi

    if [ "$XDEBUG_HOST" != "" ]; then
        PHP_ARGS="$PHP_ARGS -d xdebug.remote_host=$XDEBUG_HOST"
    fi
    echo "[info] starting php-fpm: /usr/sbin/php-fpm --nodaemonize --force-stderr $PHP_ARGS"
    exec /usr/sbin/php-fpm --nodaemonize --force-stderr $PHP_ARGS
else
    if [ -f /init.sh ]; then
        sleep 5 && echo "[info] Running /init.sh script" && sh /init.sh &
    fi

    echo "Run: $@"
    exec "$@"
fi

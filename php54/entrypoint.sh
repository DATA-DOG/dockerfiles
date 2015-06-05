#!/bin/bash
set -e

if [ -f /init.sh ]; then
    sleep 5 && echo "[info] Running /init.sh script" && sh /init.sh &
fi

echo "Run: $@"
exec "$@"

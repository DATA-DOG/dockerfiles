#!/bin/bash
set -e

if [ -f /var/www/composer.json ] && [ ! -d /var/www/vendor ]; then
    echo "Composer in background"
    composer install --working-dir=/var/www
fi

echo "Run: $@"
exec "$@"

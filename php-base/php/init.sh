#!/bin/bash

if [ -f /var/www/composer.json ] && [ ! -d /var/www/vendor ]; then
    echo "[info] Running composer"
    composer install --working-dir=/var/www $COMPOSER_ARGS
fi

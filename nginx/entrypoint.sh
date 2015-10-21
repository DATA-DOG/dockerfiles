#!/bin/bash

cp -f /etc/nginx/site-templates/*.conf /etc/nginx/sites-enabled/ &>> /dev/null

exec "$@"

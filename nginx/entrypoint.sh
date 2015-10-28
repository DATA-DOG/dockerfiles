#!/bin/bash

for FILE in `ls -A /etc/nginx/site-templates/*.conf`; do
    # reset template if it is not mounted
    NAME=$(basename $FILE)
    if mount | grep "/etc/nginx/sites-enabled/$NAME"; then
        echo "[INFO] skiping template update: $FILE";
    else
        echo "[INFO] updating nginx site template:  /etc/nginx/sites-enabled/$NAME > $FILE";
        cp -f "$FILE" "/etc/nginx/sites-enabled/$NAME"
    fi
done

exec "$@"

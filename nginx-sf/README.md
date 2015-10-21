# nginx image for symfony

This image:

 - includes default symfony !DEV! nginx config in `/etc/nginx/sites-enabled/symfony.conf`
 - requires linked to php container (name must be php, port 9000 must be exposed)
 - requires symfony project mounted on `/var/www`

## configuration

Environment config:

 - `APP_FILE` index file name (default `app_dev`, do not append `.php` in here) 
 - `PHP_HOST` php-fpm host (default `php`) 
 - `PUB_DIR` public dir (default `web`)

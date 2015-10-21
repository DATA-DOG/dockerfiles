# nginx image for laravel

This image:

 - includes default laravel nginx config in `/etc/nginx/sites-enabled/laravel.conf`
 - requires linked to php container (name must be php, port 9000 must be exposed)
 - requires laravel project mounted on `/var/www`

## configuration

Environment config:

 - `APP_FILE` index file name (default `index`, do not append `.php` in here) 
 - `PHP_HOST` php-fpm host (default `php`) 
 - `PUB_DIR` public dir (default `public`) 


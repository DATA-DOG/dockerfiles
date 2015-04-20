# nginx image for laravel

This image:

 - includes default laravel nginx config in `/etc/nginx/sites-enabled/laravel.conf`
 - requires linked to php container (name must be php, port 9000 must be exposed)
 - requires laravel project mounted on `/var/www`

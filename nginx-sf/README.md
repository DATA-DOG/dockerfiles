# nginx image for symfony

This image:

 - includes default symfony !DEV! nginx config in `/etc/nginx/sites-enabled/symfony.conf`
 - requires linked to php container (name must be php, port 9000 must be exposed)
 - requires symfony project mounted on `/var/www`

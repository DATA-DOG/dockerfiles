FROM datadoglt/nginx:latest
MAINTAINER "DataDog" <info@datadog.lt>

ENV APP_FILE "app_dev"
ENV PHP_HOST "php"
ENV PUB_DIR "web"

# project volume
VOLUME /var/www

# Add default config
COPY default.conf /etc/nginx/site-templates/symfony.conf

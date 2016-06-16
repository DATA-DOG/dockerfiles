FROM datadoglt/nginx:latest
MAINTAINER "DataDog" <info@datadog.lt>

ENV APP_FILE "index"
ENV PHP_HOST "php"
ENV PUB_DIR "public"
ENV UPLOAD_SIZE "10m"

# project volume
VOLUME /var/www

# Add default config
COPY default.conf /etc/nginx/site-templates/laravel.conf

FROM datadoglt/supervised:latest
MAINTAINER "DataDog" <info@datadog.lt>

COPY /supervisor/entrypoint.sh /entrypoint.sh
COPY /php/init.sh /init.sh

CMD ["start"]
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /var/www

EXPOSE 80

################################################################################
#                                  SUPERVISOR                                  #
################################################################################

COPY nginx/start-nginx.sh /usr/local/bin/start-nginx.sh
COPY php/entrypoint.sh /usr/local/bin/start-php-fpm.sh
COPY supervisor/php-service.ini /etc/supervisord.d/php-service.ini
COPY supervisor/nginx-service.ini /etc/supervisord.d/nginx-service.ini
COPY nginx/default.conf /etc/nginx/site-templates/default.conf

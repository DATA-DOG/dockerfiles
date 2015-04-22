FROM datadoglt/base:latest
MAINTAINER "DataDog" <info@datadog.lt>

CMD /usr/sbin/httpd -D FOREGROUND

EXPOSE 80

VOLUME ["/var/www"]

# Install nginx
RUN yum -y install httpd mod_fastcgi && \
    yum clean all

# Configure httpd
RUN sed -i "s/\/var\/www\/html/\/var\/www/" /etc/httpd/conf/httpd.conf && \
    sed -i "s/\AllowOverride None/\AllowOverride All/" /etc/httpd/conf/httpd.conf

# Add default config
COPY php-fpm.conf /etc/httpd/conf.d/php-fpm.conf

FROM datadoglt/supervised:latest
MAINTAINER "DataDog" <info@datadog.lt>

COPY entrypoint.sh /entrypoint.sh
COPY init.sh /init.sh

CMD ["start"]
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /var/www

EXPOSE 80

################################################################################
#                                      PHP                                     #
################################################################################
ENV REMI_REPO http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
ENV GITHUB_TOKEN 89fdb82a7b2c50bf20c39bfb87614acd68901e80

# Install remi repo
RUN yum install -y $REMI_REPO && yum clean all

# install php with packages
# if soap extension is missing it fails to launch fpm
# related to soap wsdl cache dir in www.conf
RUN yum install --enablerepo=remi,remi-php71 -y \
        git \
        php-bcmath \
        php-cli \
        php-mcrypt \
        php-memcached \
        php-curl \
        php-fpm \
        php-gd \
        php-iconv \
        php-intl \
        php-mysql \
        php-mbstring \
        php-memcached \
        php-pdo \
        php-process \
        php-soap \
        php-pecl-zip \
        php-xml \
        php-pecl-xdebug && \
    yum clean all

# change permissions for default php session and wsdl cache directories
RUN chown www:www -R /var/lib/php

# set custom configuration
RUN echo "date.timezone=UTC" > /etc/php.d/30-timezone.ini && \
    echo "cgi.fix_pathinfo=0" > /etc/php.d/30-cgi.ini && \
    echo "" > /etc/php.d/15-xdebug.ini && \
    echo "display_errors=stderr" > /etc/php.d/30-errors.ini

# copy default configuration of fpm
COPY php/www.conf /etc/php-fpm.d/www.conf
COPY php/debug.sh /usr/local/bin/php-debug

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/bin \
        --filename=composer && \
    composer config -g github-oauth.github.com $GITHUB_TOKEN

################################################################################
#                                     NGINX                                    #
################################################################################

ENV APP_FILE "index"
ENV PUB_DIR "public"
ENV UPLOAD_SIZE "10m"

# Install nginx
COPY nginx/nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum -y install nginx --enablerepo=nginx && \
    yum clean all

# add envplate
RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && \
    chmod +x /usr/local/bin/ep

# add default dirs
RUN mkdir /etc/nginx/site-templates && mkdir /etc/nginx/sites-enabled

# Add default config
COPY nginx/nginx.conf /etc/nginx/nginx.conf

################################################################################
#                                  SUPERVISOR                                  #
################################################################################

COPY nginx/start-nginx.sh /usr/local/bin/start-nginx.sh
COPY php/start-php-fpm.sh /usr/local/bin/start-php-fpm.sh
COPY php/php-service.ini /etc/supervisord.d/php-service.ini
COPY nginx/nginx-service.ini /etc/supervisord.d/nginx-service.ini
COPY nginx/default.conf /etc/nginx/site-templates/default.conf

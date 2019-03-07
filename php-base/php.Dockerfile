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
RUN yum install --enablerepo=remi,remi-php{PHP_VERSION} -y \
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
        php-redis \
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

# create php-fpm folder
RUN mkdir -p /run/php-fpm

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/bin \
        --filename=composer && \
    composer config -g github-oauth.github.com $GITHUB_TOKEN

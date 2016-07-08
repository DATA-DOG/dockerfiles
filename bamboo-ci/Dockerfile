FROM descoped/bamboo
MAINTAINER Paulius Masiliunas <pmasiliunas@gmail.com>

ENV COMPOSER_VERSION 1.1.2

# Install PHP
RUN add-apt-repository ppa:ondrej/php && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    php7.0-fpm \
    php7.0-gd \
    php7.0-mbstring \
    php7.0-curl \
    php7.0-mcrypt \
    php7.0-mysql \
    php7.0-xml \
    php7.0-zip \
    php7.0-intl \
    php-memcached \
  && rm -r /var/lib/apt/lists/*

# Install composer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} \
  && rm -rf /tmp/composer-setup.php

# Install NPM
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && apt-get install -y nodejs build-essential

# Install global bower, gulp
RUN npm install -g bower gulp

# Install ansible
RUN apt-get install software-properties-common && apt-add-repository ppa:ansible/ansible && apt-get update && apt-get install -y ansible
# base php-fpm image

Based from centos7-base. Installs php 7.1 from remi repository
with following extensions:

 - php-mcrypt
 - php-pdo
 - php-mysql
 - php-mbstring
 - php-intl
 - php-soap

### Environment variables

To customize PHP, you can set the following:

 - `XDEBUG` - if is set and is not empty enables xdebug (xdebug.remote_enable=on)
 - `XDEBUG_HOST` - if is not set, default docker addr is used
 - `PHP_ARGS` - additional arguments for php-fpm

#!/usr/bin/env bash
set -e

PHP_VERSION=$1
TAG=$2

if [[ $TAG == '' ]]; then
   TAG='latest'
fi

echo $TAG;

# remove last version
rm -rf "./build/php-$PHP_VERSION"

# copy all the resources
mkdir -p "./build/php-$PHP_VERSION"
cp -r php/ "./build/php-$PHP_VERSION/php"
cp -r nginx/ "./build/php-$PHP_VERSION/nginx"
cp -r supervisor/ "./build/php-$PHP_VERSION/supervisor"

# make the php base version
cat php-base.Dockerfile > "./build/php-$PHP_VERSION/Dockerfile.$PHP_VERSION"
cat php.Dockerfile >> "./build/php-$PHP_VERSION/Dockerfile.$PHP_VERSION"

# make the php supervised version
cat php-supervised.Dockerfile > "./build/php-$PHP_VERSION/Dockerfile.$PHP_VERSION-web"
cat nginx.Dockerfile >> "./build/php-$PHP_VERSION/Dockerfile.$PHP_VERSION-web"
cat php.Dockerfile >> "./build/php-$PHP_VERSION/Dockerfile.$PHP_VERSION-web"

# replace the version
grep -rl PHP_VERSION "./build/php-$PHP_VERSION" | xargs sed -i "s/{PHP_VERSION}/$PHP_VERSION/g"

# build
sh -c "cd ./build/php-$PHP_VERSION && docker build . -t datadoglt/php$PHP_VERSION-web:$TAG -f Dockerfile.$PHP_VERSION-web"
sh -c "cd ./build/php-$PHP_VERSION && docker build . -t datadoglt/php$PHP_VERSION:$TAG -f Dockerfile.$PHP_VERSION"

read -p "Do you want to push to docker hub? [Y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker push "datadoglt/php$PHP_VERSION:$TAG"
    docker push "datadoglt/php$PHP_VERSION-web:$TAG"
fi

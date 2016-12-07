# Dockerfiles for devs

## Examples with docker-compose

To use these images, please refer to example yml files:

 - [examples/laravel.yml](examples/laravel.yml)
 - [examples/symfony.yml](examples/symfony.yml)
 - [examples/apache.yml](examples/apache.yml)


## Helpers

 1. Clone this project

    `git clone https://github.com/DATA-DOG/dockerfiles.git ~/.datadog-dockerfiles`

2. Add to your `~/.bashrc` file

      ```
      export PATH=$PATH:~/.datadog-dockerfiles/bin

      alias run-behat="docker-compose exec --user www php /var/www/vendor/bin/behat"
      alias run-unit="docker-compose exec --user www php /var/www/vendor/bin/phpunit"
      alias dc="docker-compose"
      ```

## Using docker-gen

### for Docker-Compose v1

 ```
 service nginx stop && service apache2 stop
 docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
 ```

### for Docker-Compose v2

Run on computer startup:

```
cd ~/.datadog-dockerfiles/proxy;
dc up -d;
```

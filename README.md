# Dockerfiles for devs

## Examples with docker-compose

To use these images, please refer to example yml files:

 - [examples/laravel.yml](examples/laravel.yml)
 - [examples/symfony.yml](examples/symfony.yml)
 - [examples/apache.yml](examples/apache.yml)


# Helpers

 - `git clone https://github.com/DATA-DOG/dockerfiles.git ~/.datadog-dockerfiles`
 - `export PATH=$PATH:~/.datadog-dockerfiles/bin`

# Using docker-gen

 - `service nginx stop && service apache2 stop`
 - `docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy`

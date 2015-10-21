# Base nginx image

Latest NGINX for centos + envplate

# Usage

Just add your configuration files to `/etc/sites-enabled` and start container.

# Usage with templating

 - Add your configuration files to `/etc/site-templates` and start container.
 - See https://github.com/kreuzwerker/envplate for how to customize templates
 - Add your environment variables to docker-compose.yml
 - Start container and envplate will do the rest

# Build

```
docker build -t datadoglt/nginx .
```

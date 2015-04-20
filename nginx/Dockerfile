FROM datadoglt/base:latest
MAINTAINER "DataDog" <info@datadog.lt>

CMD /usr/sbin/nginx

EXPOSE 80

VOLUME ["/etc/nginx/sites-enabled", "/var/log/nginx", "/etc/nginx/certs"]

# Install nginx
COPY nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum -y install nginx --enablerepo=nginx && \
    yum clean all

# Add default config
COPY nginx.conf /etc/nginx/nginx.conf

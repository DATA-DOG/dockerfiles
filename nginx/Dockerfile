FROM datadoglt/base:latest
MAINTAINER "DataDog" <info@datadog.lt>

EXPOSE 80

VOLUME ["/etc/nginx/sites-enabled", "/var/log/nginx", "/etc/nginx/certs"]

# Install nginx
COPY nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum -y install nginx --enablerepo=nginx && \
    yum clean all

# add envplate
RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && \
    chmod +x /usr/local/bin/ep && \
    mkdir /etc/nginx/site-templates

# Add default config
COPY nginx.conf /etc/nginx/nginx.conf

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "/usr/local/bin/ep", "-v", "/etc/nginx/sites-enabled/*.conf", "--", "/usr/sbin/nginx" ]

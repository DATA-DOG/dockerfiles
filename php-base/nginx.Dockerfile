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
RUN mkdir /etc/nginx/sites-enabled

# Add default config
COPY nginx/nginx.conf /etc/nginx/nginx.conf

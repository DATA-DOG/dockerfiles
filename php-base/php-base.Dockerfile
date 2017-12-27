FROM datadoglt/base:latest
MAINTAINER "DataDog" <info@datadog.lt>

ENV REMI_REPO http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
ENV GITHUB_TOKEN 89fdb82a7b2c50bf20c39bfb87614acd68901e80
ENV WWW_DIR /var/www

COPY /php/entrypoint.sh /entrypoint.sh
COPY /php/init.sh /init.sh
RUN chmod +x /entrypoint.sh

CMD ["fpm"]
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR $WWW_DIR

EXPOSE 9000

FROM datadoglt/base:latest
MAINTAINER "DataDog" <info@datadog.lt>

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

VOLUME ["/etc/supervisord.d", "/var/log/supervisor"]

# Install supervisor
RUN yum -y install epel-release && \
    yum -y install supervisor && \
    yum clean all

# Configure supervisor
RUN /usr/bin/echo_supervisord_conf > /etc/supervisord.conf && \
    sed -i -e "s/^nodaemon=false/nodaemon=true/" /etc/supervisord.conf && \
    echo [include] >> /etc/supervisord.conf && \
    echo 'files = /etc/supervisord.d/*.ini' >> /etc/supervisord.conf

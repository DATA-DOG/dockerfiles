FROM datadoglt/php:54
MAINTAINER "DataDog" <info@datadog.lt>

RUN yum install -y tar

RUN curl -L http://downloads.zend.com/guard/6.0.0/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz -o zend-guard.tar.gz && \
    tar xvf zend-guard.tar.gz -C /opt && \
    rm -f zend-guard.tar.gz && \
    echo "zend_extension=/opt/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64/php-5.4.x/ZendGuardLoader.so" >> /etc/php.d/40-zend-guard.ini

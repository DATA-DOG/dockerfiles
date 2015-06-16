FROM datadoglt/php53
MAINTAINER "DataDog" <info@datadog.lt>

RUN yum install -y tar && yum clean all

RUN curl -L http://downloads.zend.com/guard/5.5.0/ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz -o zend-guard.tar.gz && \
    tar xvf zend-guard.tar.gz -C /opt && \
    rm -f zend-guard.tar.gz && \
    echo "zend_extension=/opt/ZendGuardLoader-php-5.3-linux-glibc23-x86_64/php-5.3.x/ZendGuardLoader.so" >> /etc/php.d/40-zend-guard.ini

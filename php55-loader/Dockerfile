FROM datadoglt/php:55
MAINTAINER "DataDog" <info@datadog.lt>

RUN yum install -y tar

RUN curl -L http://downloads.zend.com/guard/7.0.0/zend-loader-php5.5-linux-x86_64.tar.gz -o zend-guard.tar.gz && \
    tar xvf zend-guard.tar.gz -C /opt && \
    rm -f zend-guard.tar.gz && \
    echo "zend_extension=/opt/zend-loader-php5.5-linux-x86_64/ZendGuardLoader.so" >> /etc/php.d/40-zend-guard.ini && \
    echo "zend_extension=/opt/zend-loader-php5.5-linux-x86_64/opcache.so" >> /etc/php.d/40-zend-guard.ini

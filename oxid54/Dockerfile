FROM datadoglt/php54-loader
MAINTAINER "DataDog" <info@datadog.lt>

RUN yum install -y \
        tar \
        make \
        gcc \
        libjpeg-turbo-utils \
        libpng-devel \
        pngquant \
        optipng && \
    yum clean all

RUN curl -L https://github.com/pornel/pngquant/archive/2.5.0.tar.gz > pngquant.tar.gz && \
        tar xzf pngquant.tar.gz && \
        cd pngquant-2.5.0 && \
        make install
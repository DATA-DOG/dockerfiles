FROM datadoglt/base
MAINTAINER "DataDog" <info@datadog.lt>

ENV BUILD_TASK ""
ENV GRUNT_TASK ""
ENV GULP_TASK ""
ENV NPM_TASK ""

ENV NODE_VERSION v6.10.3

# Install node.js
RUN yum install -y gcc-c++ make git tar && yum clean -y all

# Setup nodejs
RUN curl -L http://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz -O && \
    tar xvf /node-$NODE_VERSION-linux-x64.tar.gz -C /usr/local/ && \
    ln -s /usr/local/node-$NODE_VERSION-linux-x64/bin/node /usr/bin/node && \
    ln -s /usr/local/node-$NODE_VERSION-linux-x64/bin/npm /usr/bin/npm && \
    rm -f /node-$NODE_VERSION-linux-x64.tar.gz


# Install gulp / bower / grunt globaly
RUN npm install -g \
        bower \
        yarn \
        gulp \
        grunt \
        grunt-cli

ENV PATH "$PATH:/usr/local/node-$NODE_VERSION-linux-x64/bin"

ADD run.sh /usr/bin/webtools

CMD webtools

FROM datadoglt/base
MAINTAINER "DataDog" <info@datadog.lt>

ENV GULP_TASK default
ENV NPM_TASK start

ENV NODE_VERSION v0.12.4

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
        npm-ls-scripts \
        bower \
        gulp \
        grunt \
        grunt-cli

ADD run.sh /usr/bin/run-webtools
RUN chmod +x /usr/bin/run-webtools

CMD run-webtools

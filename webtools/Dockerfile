FROM datadoglt/base
MAINTAINER "DataDog" <info@datadog.lt>

ENV GULP_TASK default
ENV NPM_TASK start

# Install node.js
RUN curl -sL https://rpm.nodesource.com/setup | bash - && \
    yum install -y gcc-c++ make git nodejs

# Install gulp / bower / grunt globaly
RUN npm install -g \
        npm-ls-scripts \
        bower \
        gulp \
        grunt

ADD run.sh /usr/bin/run-webtools
RUN chmod +x /usr/bin/run-webtools

CMD run-webtools

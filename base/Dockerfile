FROM centos:7
MAINTAINER "DataDog" <info@datadog.lt>

ENV USER_GUID 1000
ENV USER_UID 1000

# Add nginx user
RUN groupadd www -g ${USER_GUID} && \
    useradd www -g ${USER_GUID} -u ${USER_UID}

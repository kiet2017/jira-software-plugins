FROM hanruijie/atlassian-jira-software-plugins:7.5.2

LABEL maintainer="<rjhan@alauda.io>"

USER root

RUN apt-get update \
&&  apt-get upgrade \
&&  apt-get clean \
&&  rm -vrf /var/lib/apt/lists/*

USER [daemon:daemon]

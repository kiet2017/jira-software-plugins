FROM hanruijie/atlassian-jira-software-plugins:7.5.2

LABEL maintainer="<rjhan@alauda.io>"

USER root

RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list && \
echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list && \
sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list && \
apt-get -o Acquire::Check-Valid-Until=false update 

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get dist-upgrade -y 

RUN sed -i 's/jessie/stretch/g' /etc/apt/sources.list \
&&  sed -i 's/jessie/stretch/g' /etc/apt/sources.list.d/*.list \
&&  apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get dist-upgrade -y \
&&  apt-get clean \
&&  rm -vrf /var/lib/apt/lists/*

USER daemon

FROM ubuntu:14.04
MAINTAINER ShawnMa <qsma@thoughtworks.com>

ENV DEBIAN_FRONTEND noninteractive

## Repository
RUN \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7BB9C367 &&\
  echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible.list

## Packages
RUN \
  apt-get update &&\
  apt-get dist-upgrade -y --no-install-recommends &&\
  apt-get install -y --no-install-recommends curl wget vim unzip ansible apt-transport-https language-pack-en

## Utilities
RUN \
  wget -O /bin/gosu   "https://github.com/tianon/gosu/releases/download/1.6/gosu-amd64" &&\
  wget -O /bin/tini   "https://github.com/krallin/tini/releases/download/v0.8.3/tini-static" &&\
  wget -O /bin/forego "https://godist.herokuapp.com/projects/ddollar/forego/releases/0.16.1/linux-amd64/forego" &&\
  chmod u+x /bin/gosu &&\
  chmod u+x /bin/tini &&\
  chmod u+x /bin/forego

## Additional
RUN \
  locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8

## Cleanup
RUN \
  apt-get autoclean -y &&\
  apt-get autoremove -y &&\
  rm -rf /tmp/*  &&\
  rm -rf /var/tmp/* &&\
  rm -rf /var/lib/apt/lists/*

## Configurations
ADD config/hosts       /etc/ansible/hosts
ADD config/ansible.cfg /etc/ansible/ansible.cfg

CMD ["/bin/bash"]


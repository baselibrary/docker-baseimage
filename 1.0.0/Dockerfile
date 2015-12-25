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


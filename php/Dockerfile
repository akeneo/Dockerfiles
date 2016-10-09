FROM debian:jessie
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install some useful packages
RUN apt-get update && \
    apt-get -yq install \
        bash-completion curl git imagemagick supervisor vim wget sudo && \
    apt-get clean && apt-get -yq autoclean && apt-get -yq autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add PHP 7 repository
RUN wget https://www.dotdeb.org/dotdeb.gpg && apt-key add dotdeb.gpg && rm dotdeb.gpg
COPY files/dotdeb.list /etc/apt/sources.list.d/dotdeb.list

# Install PHP with some extensions
RUN apt-get update && \
    apt-get -yq install \
        bash-completion curl git imagemagick supervisor vim wget sudo \
        php7.0-cli php7.0-apcu php7.0-curl php7.0-gd php7.0-imagick php7.0-intl php7.0-mcrypt \
        php7.0-mongodb php7.0-mysql php7.0-soap php7.0-xdebug php7.0-xml php7.0-zip && \
    apt-get clean && apt-get -yq autoclean && apt-get -yq autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add a "docker" user
RUN sudo useradd docker --shell /bin/bash --create-home \
  && sudo usermod -a -G sudo docker \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'docker:secret' | chpasswd

# Install composer
ADD files/install-composer.sh /tmp/install-composer.sh
RUN chmod +x /tmp/install-composer.sh && /tmp/install-composer.sh && rm /tmp/install-composer.sh

# Configure PHP
RUN phpenmod mcrypt && \
    phpdismod xdebug

RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php/7.0/cli/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 2G/" /etc/php/7.0/cli/php.ini

# Define "docker" as current user
USER docker
WORKDIR /home/docker/

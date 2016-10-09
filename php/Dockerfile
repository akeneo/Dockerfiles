FROM debian:jessie
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install PHP with some extensions
RUN apt-get update && \
    apt-get -yq install \
        bash-completion curl git imagemagick vim wget sudo \
        php5-cli php5-apcu php5-curl php5-gd php5-imagick php5-intl php5-mongo php5-mcrypt php5-mysql php5-xdebug && \
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
RUN php5enmod mcrypt && \
    php5dismod xdebug

RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php5/cli/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 2G/" /etc/php5/cli/php.ini

# Define "docker" as current user
USER docker
WORKDIR /home/docker/

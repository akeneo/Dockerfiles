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
COPY docker/dotdeb.list /etc/apt/sources.list.d/dotdeb.list

# Install Apache + mod_php and some PHP extensions
RUN apt-get update && \
    apt-get -yq install \
        apache2 libapache2-mod-php7.0 php7.0-cli \
        php7.0-apcu php7.0-curl php7.0-gd php7.0-imagick \
        php7.0-intl php7.0-mcrypt php7.0-mongodb php7.0-mysql \
        php7.0-soap php7.0-xdebug php7.0-xml php7.0-zip && \
    apt-get clean && apt-get -yq autoclean && apt-get -yq autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add a "docker" user
RUN sudo useradd docker --shell /bin/bash --create-home \
  && sudo usermod -a -G sudo docker \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'docker:secret' | chpasswd

# Install composer
ADD docker/install-composer.sh /install-composer.sh
RUN chmod +x /install-composer.sh && /install-composer.sh && rm /install-composer.sh

# Configure PHP
RUN phpenmod mcrypt && \
    phpdismod xdebug

RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php/7.0/cli/php.ini && \
    sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php/7.0/apache2/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 2G/" /etc/php/7.0/cli/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.0/apache2/php.ini

# Configure Apache
RUN a2enmod rewrite && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN sed -i "s/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=docker/" /etc/apache2/envvars && \
    sed -i "s/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=docker/" /etc/apache2/envvars && \
    chown -R docker: /var/lock/apache2

# Expose Apache to the host
EXPOSE 80

# Define "docker" as current user
USER docker
WORKDIR /home/docker/

# Run apache in foreground
CMD ["sudo", "/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

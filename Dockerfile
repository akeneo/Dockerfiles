FROM debian:jessie
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install Apache + mod_php and some PHP extensions
RUN apt-get update && \
    apt-get -yq install \
        bash-completion curl git imagemagick supervisor vim wget sudo \
        apache2 libapache2-mod-php5 php5-cli \
        php5-apcu php5-curl php5-gd php5-imagick php5-intl php5-mongo php5-mcrypt php5-mysql php5-xdebug && \
    apt-get clean && apt-get -yq autoclean && apt-get -yq autoremove --purge && \
    rm -rf rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add a "docker" user
RUN sudo useradd docker --shell /bin/bash --create-home \
  && sudo usermod -a -G sudo docker \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'docker:secret' | chpasswd

# Install composer
ADD docker/install-composer.sh /install-composer.sh
RUN chmod +x /install-composer.sh && /install-composer.sh && rm /install-composer.sh

# Configure PHP
RUN php5enmod mcrypt && \
    php5dismod xdebug

RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php5/cli/php.ini && \
    sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php5/apache2/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 2G/" /etc/php5/cli/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php5/apache2/php.ini

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

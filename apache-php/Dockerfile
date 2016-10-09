FROM carcel/php:latest
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Install Apache + mod_php and some PHP extensions
RUN apt-get update && \
    apt-get -yq install apache2 libapache2-mod-php7.0 && \
    apt-get clean && apt-get -yq autoclean && apt-get -yq autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure PHP
RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php/7.0/apache2/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.0/apache2/php.ini

# Configure Apache
RUN a2enmod rewrite && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN sed -i "s/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=docker/" /etc/apache2/envvars && \
    sed -i "s/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=docker/" /etc/apache2/envvars && \
    chown -R docker: /var/lock/apache2

# Expose Apache to the host
EXPOSE 80 443

# Define "docker" as current user
USER docker

# Run apache in foreground
CMD ["sudo", "/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

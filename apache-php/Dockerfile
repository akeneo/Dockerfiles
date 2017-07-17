FROM akeneo/php:7.1
MAINTAINER Damien Carcel <damien.carcel@akeneo.com>

# Define "root" as current user
USER root

# Install Apache + mod_php and some PHP extensions
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install apache2 libapache2-mod-php7.1 && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Configure PHP Apache
RUN sed -i "s/;date.timezone =/date.timezone = Etc\/UTC/" /etc/php/7.1/apache2/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.1/apache2/php.ini && \
    sed -i "s/upload_max_filesize = .*/upload_max_filesize = 20M/" /etc/php/7.1/apache2/php.ini && \
    sed -i "s/post_max_size = .*/post_max_size = 20M/" /etc/php/7.1/apache2/php.ini

RUN phpdismod xdebug

# Configure Apache
RUN a2enmod rewrite && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN sed -i "s/export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=docker/" /etc/apache2/envvars && \
    sed -i "s/export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=docker/" /etc/apache2/envvars && \
    chown -R docker: /var/lock/apache2

# Expose Apache
EXPOSE 80 443

COPY files/apache-foreground /usr/local/bin
RUN  chmod +x /usr/local/bin/apache-foreground

# Define "docker" as current user
USER docker

# Run apache in foreground
CMD ["sudo", "/usr/local/bin/apache-foreground"]

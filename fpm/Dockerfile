FROM carcel/php:7.0
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Install PHP FPM
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests -yq install php7.0-fpm && \
    apt-get clean && apt-get -yq autoclean && apt-get -yq autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure PHP FPM
RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php/7.0/fpm/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.0/fpm/php.ini && \
    sed -i "s/upload_max_filesize = .*/upload_max_filesize = 20M/" /etc/php/7.0/fpm/php.ini && \
    sed -i "s/post_max_size = .*/post_max_size = 20M/" /etc/php/7.0/fpm/php.ini

RUN sed -i "s/user = www-data/user = docker/" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/group = www-data/group = docker/" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/listen.owner = www-data/listen.owner = docker/" /etc/php/7.0/fpm/pool.d/www.conf && \
    sed -i "s/listen.group = www-data/listen.group = docker/" /etc/php/7.0/fpm/pool.d/www.conf

# Expose PHP FPM to the host
EXPOSE 9000

# Define "docker" as current user
USER docker

# Run apache in foreground
CMD ["sudo", "php-fpm7.0", "-F"]

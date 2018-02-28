FROM akeneo/php:7.2
MAINTAINER Damien Carcel <damien.carcel@akeneo.com>

# Install PHP FPM
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install php7.2-fpm && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Configure PHP FPM
RUN sed -i "s/user = www-data/user = docker/" /etc/php/7.2/fpm/pool.d/www.conf && \
    sed -i "s/group = www-data/group = docker/" /etc/php/7.2/fpm/pool.d/www.conf

RUN phpenmod akeneo
RUN phpdismod xdebug

RUN mkdir -p /run/php && sed -i "s/listen = .*/listen = 9001/" /etc/php/7.2/fpm/pool.d/www.conf

# Run FPM in foreground
CMD ["sudo", "php-fpm7.2", "-F"]

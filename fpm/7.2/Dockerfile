FROM akeneo/php:7.2
MAINTAINER Damien Carcel <damien.carcel@akeneo.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install php7.2-fpm && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/* && \
    phpenmod akeneo && phpdismod xdebug

COPY files/start-fpm.sh /usr/local/bin/start-fpm.sh
RUN mkdir -p /run/php && \
    chmod 777 /run/php && \
    chmod 777 /etc/php/7.2/fpm/pool.d && \
    chmod 666 /etc/php/7.2/fpm/pool.d/www.conf && \
    chmod +x /usr/local/bin/start-fpm.sh && \
    sed -i "s#error_log = /var/log/php7.2-fpm.log#error_log = syslog#g" /etc/php/7.2/fpm/php-fpm.conf

CMD ["/usr/local/bin/start-fpm.sh"]

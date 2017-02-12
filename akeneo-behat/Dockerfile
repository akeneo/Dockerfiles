FROM carcel/apache-php:php-7.1
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Add some utilities
COPY files/pim-in-ass.sh /usr/local/bin/pim-in-ass
COPY files/pim-initialize.sh /usr/local/bin/pim-initialize
COPY files/pim-cac.sh /usr/local/bin/pim-cac
RUN chmod +x /usr/local/bin/*

# Add Akeneo VHOST as default
COPY files/akeneo-behat.local.conf /etc/apache2/sites-available/000-default.conf

# Define "docker" as current user
USER docker

FROM carcel/apache-php:php-5.6
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Add some utilities
ADD files/pim-in-ass.sh /usr/local/bin/pim-in-ass
ADD files/pim-initialize.sh /usr/local/bin/pim-initialize
RUN chmod +x /usr/local/bin/*

# Add Akeneo VHOST as default
ADD files/akeneo-behat.local.conf /etc/apache2/sites-available/000-default.conf

# Define "docker" as current user
USER docker

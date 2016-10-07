FROM carcel/apache-php:5.6
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Add some utilities
ADD conf/pim-in-ass.sh /usr/local/bin/pim-in-ass
ADD conf/pim-initialize.sh /usr/local/bin/pim-initialize
RUN chmod +x /usr/local/bin/*

# Define "docker" as current user
USER docker

# Add Akeneo VHOST as default
ADD conf/akeneo-behat.local.conf /etc/apache2/sites-available/000-default.conf

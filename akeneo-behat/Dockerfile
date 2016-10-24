FROM carcel/apache-php:php-7.0
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Install perceptualdiff
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests -yq install perceptualdiff && \
    apt-get clean && apt-get -yq autoclean && apt-get -yq autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add some utilities
ADD files/pim-in-ass.sh /usr/local/bin/pim-in-ass
ADD files/pim-initialize.sh /usr/local/bin/pim-initialize
RUN chmod +x /usr/local/bin/*

# Add Akeneo VHOST as default
ADD files/akeneo-behat.local.conf /etc/apache2/sites-available/000-default.conf

# Define "docker" as current user
USER docker

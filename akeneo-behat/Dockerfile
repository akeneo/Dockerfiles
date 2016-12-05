FROM carcel/apache-php:php-5.6
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Install perceptualdiff
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install perceptualdiff && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add some utilities
COPY files/pim-in-ass.sh /usr/local/bin/pim-in-ass
COPY files/pim-initialize.sh /usr/local/bin/pim-initialize
RUN chmod +x /usr/local/bin/*

# Add Akeneo VHOST as default
COPY files/akeneo-behat.local.conf /etc/apache2/sites-available/000-default.conf

# Define "docker" as current user
USER docker

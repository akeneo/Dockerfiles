FROM carcel/apache-php:php-7.0
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Install npm and grunt
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install nodejs && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN npm install -g grunt-cli

# Add some utilities
COPY files/pim-in-ass.sh /usr/local/bin/pim-in-ass
COPY files/pim-initialize.sh /usr/local/bin/pim-initialize
RUN chmod +x /usr/local/bin/*

# Add Akeneo VHOST as default
COPY files/akeneo.local.conf /etc/apache2/sites-available/000-default.conf

# Define "docker" as current user
USER docker

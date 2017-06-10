FROM carcel/apache-php:latest
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Install some useful packages
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
    nodejs bzip2 && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
        rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
                /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
                /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Add some utilities
COPY files/pim-assets.sh /usr/local/bin/pim-assets
COPY files/pim-initialize.sh /usr/local/bin/pim-initialize
COPY files/pim-cac.sh /usr/local/bin/pim-cac
RUN chmod +x /usr/local/bin/*

# Disable default VHOST
RUN a2dissite 000-default.conf

# Add additional ports for VHOSTs
COPY files/additional-ports.conf /etc/apache2/conf-available/additional-ports.conf
RUN a2enconf additional-ports
EXPOSE 81 444

# Add Akeneo VHOSTs
COPY files/akeneo.dev.conf /etc/apache2/sites-available/akeneo.dev.conf
COPY files/akeneo-behat.dev.conf /etc/apache2/sites-available/akeneo-behat.dev.conf

# Enable Akeneo VHOSTs
RUN a2ensite akeneo.dev.conf && a2ensite akeneo-behat.dev.conf

# Define "docker" as current user
USER docker

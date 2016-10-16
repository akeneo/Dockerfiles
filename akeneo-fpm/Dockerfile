FROM carcel/fpm:latest
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "root" as current user
USER root

# Add some utilities
ADD files/pim-in-ass.sh /usr/local/bin/pim-in-ass
ADD files/pim-initialize.sh /usr/local/bin/pim-initialize
RUN chmod +x /usr/local/bin/*

# Configure PHP FPM
RUN sed -i "s/listen = .*/listen = 9001/" /etc/php/7.0/fpm/pool.d/www.conf

# Expose PHP FPM
EXPOSE 9001

# Define "docker" as current user
USER docker

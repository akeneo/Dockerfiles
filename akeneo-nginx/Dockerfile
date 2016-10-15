FROM carcel/nginx
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Define "docker" as current user
USER root

# Configure nginx
COPY files/akeneo.local.conf /etc/nginx/conf.d/default.conf

# Expose nginx
EXPOSE 9001

# Define "docker" as current user
USER docker

FROM nginx
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

# Install sudo
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install sudo && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Add a "docker" user
RUN useradd docker --shell /bin/bash --create-home \
  && usermod --append --groups sudo docker \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'docker:secret' | chpasswd

# Configure nginx
RUN sed -i "s/user  nginx;/user docker;/" /etc/nginx/nginx.conf
COPY files/application.dev.conf /etc/nginx/conf.d/default.conf

# Define "docker" as current user
USER docker

# Run nginx in foreground
CMD ["sudo", "nginx", "-g", "daemon off;"]

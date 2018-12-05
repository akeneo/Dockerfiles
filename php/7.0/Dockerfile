FROM debian:stretch-slim
MAINTAINER Damien Carcel <damien.carcel@akeneo.com>

ENV DEBIAN_FRONTEND noninteractive

# Install some useful packages
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        bash-completion ca-certificates curl git imagemagick less make \
        mongodb-clients mysql-client perceptualdiff procps ssh-client sudo unzip vim wget && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Install PHP with some extensions
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        php7.0-cli php7.0-apcu php7.0-curl php7.0-gd php7.0-imagick php7.0-intl php7.0-mcrypt \
        php7.0-mongo php7.0-mysql php7.0-soap php7.0-xdebug php7.0-xml php7.0-zip php7.0-ldap && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Configure PHP CLI
COPY files/akeneo.ini /etc/php/7.0/mods-available/akeneo.ini
RUN phpenmod akeneo
RUN phpdismod xdebug

# Add a "docker" user
RUN useradd docker --shell /bin/bash --create-home \
  && usermod --append --groups sudo docker \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'docker:secret' | chpasswd

# Install composer
RUN curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chmod +x /usr/local/bin/composer

# Copy "entrypoint"
COPY ./files/entrypoint.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/entrypoint.sh

WORKDIR /home/docker/

ENV PATH=bin:vendor/bin:$PATH

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

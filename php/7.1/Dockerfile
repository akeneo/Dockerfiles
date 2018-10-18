FROM debian:stretch-slim
MAINTAINER Damien Carcel <damien.carcel@akeneo.com>

ENV DEBIAN_FRONTEND noninteractive

# Install some useful packages
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        apt-transport-https bash-completion ca-certificates curl git gnupg imagemagick \
        less make mongodb-clients mysql-client perceptualdiff procps ssh-client sudo unzip vim wget && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Add Sury PHP repository
RUN wget -O sury.gpg https://packages.sury.org/php/apt.gpg && apt-key add sury.gpg && rm sury.gpg
COPY files/sury.list /etc/apt/sources.list.d/sury.list

# Install PHP with some extensions
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        php7.1-cli php7.1-apcu php7.1-mbstring php7.1-curl php7.1-gd php7.1-imagick php7.1-intl php7.1-bcmath \
        php7.1-mcrypt php7.1-mongodb php7.1-mysql php7.1-soap php7.1-xdebug php7.1-xml php7.1-zip php7.1-ldap && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf  /var/lib/apt/lists/* /tmp/* /var/tmp/* \
            /usr/share/doc/* /usr/share/groff/* /usr/share/info/* /usr/share/linda/* \
            /usr/share/lintian/* /usr/share/locale/* /usr/share/man/*

# Configure PHP CLI
COPY files/akeneo.ini /etc/php/7.1/mods-available/akeneo.ini
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

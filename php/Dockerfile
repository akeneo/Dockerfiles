FROM debian:jessie
MAINTAINER Damien Carcel <damien.carcel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install some useful packages
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        ca-certificates bash-completion curl git imagemagick vim wget sudo && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install and configure Gosu
RUN set -x && \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64" && \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64.asc" && \
    export GNUPGHOME="$(mktemp -d)" && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 && \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu && \
    rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc && \
    chmod +x /usr/local/bin/gosu && \
    gosu nobody true && \
    chown root:users /usr/local/bin/gosu && \
    chmod +s /usr/local/bin/gosu

# Install PHP with some extensions
RUN apt-get update && \
    apt-get --no-install-recommends --no-install-suggests --yes --quiet install \
        php5-cli php5-apcu php5-curl php5-gd php5-imagick php5-intl php5-mongo php5-mcrypt php5-mysql php5-xdebug && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add a "docker" user
RUN useradd docker --shell /bin/bash --create-home \
  && usermod --append --groups sudo docker \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'docker:secret' | chpasswd

# Install composer
RUN curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chmod +x /usr/local/bin/composer

RUN php5enmod mcrypt && php5dismod xdebug

RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php5/cli/php.ini && \
    sed -i "s/memory_limit = .*/memory_limit = 2G/" /etc/php5/cli/php.ini && \
    sed -i "s/upload_max_filesize = .*/upload_max_filesize = 20M/" /etc/php5/cli/php.ini && \
    sed -i "s/post_max_size = .*/post_max_size = 20M/" /etc/php5/cli/php.ini

COPY ./files/entrypoint.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/entrypoint.sh

# Define "docker" as current user
USER docker
WORKDIR /home/docker/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

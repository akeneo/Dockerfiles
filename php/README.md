# PHP CLI on Docker

[![Build Status](https://travis-ci.org/akeneo/Dockerfiles.svg?branch=php-7.1)](https://travis-ci.org/akeneo/Dockerfiles/tree/php-7.1)

This is a basic Docker environment for PHP development and testing, based on [debian:stretch-slim](https://hub.docker.com/_/debian/). **This image does not contain Akeneo PIM**.

The environment comes with Debian 9 (Stretch) and PHP 7.1 (from [Sury repository](https://deb.sury.org/)), and some PHP extensions: apcu, mcrypt, intl, mysql, curl, gd, mongo, soap, xml, zip and xdebug (this last is deactivated by default, run `phpenmod xdebug` to enable it).

## How to use it

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/akeneo/apache-php/) by running:

```bash
$ docker run -d --name akeneo-php akeneo/php:7.1
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t akeneo-php .
```

Then you can run a container like this:

```bash
$ docker run --name akeneo-php -d php
```

## License

This repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

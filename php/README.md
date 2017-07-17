# PHP CLI on Docker

[![Build Status](https://travis-ci.org/akeneo/Dockerfiles.svg?branch=php-5.6)](https://travis-ci.org/akeneo/Dockerfiles/tree/php-5.6)

This is a basic Docker environment for PHP development and testing, based on [debian:jessie](https://hub.docker.com/_/debian/). **This image does not contain Akeneo PIM**.

The environment comes with native Debian Jessie PHP 5.6, and some PHP extensions: apcu, mcrypt, intl, mysql, curl, gd, mongo, and xdebug (this last one comes deactivated, run `php5enmod xdebug` to enable it).

## How to use it?

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/akeneo/apache-php/) by running:

```bash
$ docker run -d --name fpm akeneo/php:5.6
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t "akeneo-php" .
```

Then you can run a container like this:

```bash
$ docker run --name akeneo-fpm -d php
```

## License

This repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

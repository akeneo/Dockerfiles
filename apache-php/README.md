# Apache and PHP on Docker

[![Build Status](https://travis-ci.org/akeneo/Dockerfiles.svg?branch=php-7.0)](https://travis-ci.org/akeneo/Dockerfiles/tree/php-7.0)

This is a basic Docker environment for PHP development, based on [akeneo/php](https://hub.docker.com/r/akeneo/php). **This image does not contain Akeneo PIM**.

It provides a pre-configured Apache (2.4) + mod_php (PHP 7.0) web server, based on Debian 9 (Stretch).

The environment come with some PHP extensions: apcu, mcrypt, intl, mysql, curl, gd, mongo, and xdebug (this last one comes deactivated, run `phpenmod xdebug` and restart Apache to enable it).

## How to use it?

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/akeneo/apache-php/) by running:

```bash
$ docker run -i -t --rm akeneo/apache-php:php-7.0 bash
```

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t "akeneo-apache-php" .
```

Then you can run a container like this:

```bash
$ docker run -i -t --rm akeneo-apache-php bash
```

## License

This repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

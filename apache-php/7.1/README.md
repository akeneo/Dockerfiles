# Apache and PHP on Docker

[![Build Status](https://travis-ci.org/akeneo/Dockerfiles.svg)](https://travis-ci.org/akeneo/Dockerfiles)

This Dockerfile is a basic environment for PHP development, providing a preconfigured Apache (2.4) web server with `mod_php` enabled.

It is based on [akeneo/php](https://hub.docker.com/r/akeneo/php), and comes with the following PHP extensions: apcu, curl, gd, intl, mcrypt, mongo, mysql, soap, xml, zip, and xdebug (this last one is deactivated by default, run `phpenmod xdebug` and restart Apache to enable it).

**This image does not contain Akeneo PIM**.

## Supported tags and corresponding `Dockerfile` links

- `php-7.1`, `latest` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/apache-php/7.1/Dockerfile): The environment comes with Debian 9 (Stretch) with PHP 7.1 from [Sury repository](https://deb.sury.org/)
- `php-7.0` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/apache-php/7.0/Dockerfile): The environment comes with Debian 9 (Stretch) with native PHP 7.0
- `php-5.6` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/apache-php/5.6/Dockerfile): The environment comes with Debian 8 (Jessie) with native PHP 5.6

## How to use it

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/akeneo/apache-php/) by running:

```bash
$ docker run --name akeneo-apache-php -p 8080:80 -d akeneo/apache-php
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### Build the image from GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t akeneo/apache-php .
```

Full documentation is accessible [here](https://github.com/akeneo/Dockerfiles#how-to-use-these-images)

## License

This image is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

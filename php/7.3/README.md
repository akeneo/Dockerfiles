# PHP CLI on Docker

[![Build Status](https://travis-ci.org/akeneo/Dockerfiles.svg)](https://travis-ci.org/akeneo/Dockerfiles)

This Dockerfile is a basic environment for PHP development and testing, based on [debian:stretch-slim or debian:jessie-slim](https://hub.docker.com/_/debian/), depending of PHP version (see the supported tag list below).

It comes with the following PHP extensions: apcu, curl, gd, intl, mysql, xml, zip and xdebug (this last one is deactivated by default, run `phpenmod xdebug` to enable it).

Extensions mcrypt and mongo are also present on PHP 7.1 and previous versions.

**This image does not contain Akeneo PIM**.

## Supported tags and corresponding `Dockerfile` links

- `7.3`, `latest` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/php/7.3/Dockerfile): The environment comes with Debian 9 (Stretch) with PHP 7.3 from [Sury repository](https://deb.sury.org/)
- `7.2` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/php/7.2/Dockerfile): The environment comes with Debian 9 (Stretch) with PHP 7.2 from [Sury repository](https://deb.sury.org/)
- `7.1` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/php/7.1/Dockerfile): The environment comes with Debian 9 (Stretch) with PHP 7.1 from [Sury repository](https://deb.sury.org/)
- `7.0` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/php/7.0/Dockerfile): The environment comes with Debian 9 (Stretch) with native PHP 7.0
- `5.6` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/php/5.6/Dockerfile): The environment comes with Debian 8 (Jessie) with native PHP 5.6

## How to use it

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/akeneo/apache-php/) by running:

```bash
$ docker run -d --name akeneo-php akeneo/php
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### Build the image from GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t akeneo/php .
```

Full documentation is accessible [here](https://github.com/akeneo/Dockerfiles#how-to-use-these-images)

## License

This image is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

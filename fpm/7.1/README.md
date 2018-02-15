# PHP FPM on Docker

[![Build Status](https://travis-ci.org/akeneo/Dockerfiles.svg)](https://travis-ci.org/akeneo/Dockerfiles)

This is a basic Docker environment for PHP FPM development, based on [akeneo/php](https://hub.docker.com/r/akeneo/php).

It comes with the following PHP extensions: apcu, mcrypt, intl, mysql, curl, gd, mongo, soap, xml, zip and xdebug (this last one is deactivated by default, run `phpenmod xdebug` to enable it)

It is intended to be used [httpd](https://hub.docker.com/_/httpd) with FCGI enable or [nginx](https://hub.docker.com/_/nginx).

The PHP FPM daemon is configured with "docker" as user and group, and listens to the port `9001`.

**This image does not contain Akeneo PIM**.

## Supported tags and respective `Dockerfile` links

- `php-7.1`, `latest` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/fpm/Dockerfile): The environment comes with Debian 9 (Stretch) with PHP 7.1 from [Sury repository](https://deb.sury.org/)
- `php-7.0` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/fpm/7.0/Dockerfile): The environment comes with Debian 9 (Stretch) with native PHP 7.0
- `php-5.6` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/fpm/5.6/Dockerfile): The environment comes with Debian 8 (Jessie) with native PHP 5.6

## How to use it

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/akeneo/apache-php/) by running:

```bash
$ docker run -d --name akeneo-fpm akeneo/fpm
```

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t akeneo-fpm .
```

Then you can run a container like this:

```bash
$ docker run --name akeneo-fpm -d akeneo-fpm
```

Full documentation is accessible [here](https://github.com/akeneo/Dockerfiles#how-to-use-these-images)

## License

This repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

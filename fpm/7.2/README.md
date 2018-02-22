# PHP FPM on Docker

[![Build Status](https://travis-ci.org/akeneo/Dockerfiles.svg)](https://travis-ci.org/akeneo/Dockerfiles)

This Dockerfile is a basic environment for PHP development, providing a preconfigured FastCGI Process Manager (FPM).

It is based on [akeneo/php](https://hub.docker.com/r/akeneo/php), and comes with the following PHP extensions: apcu, curl, gd, intl, mysql, soap, xml, zip, and xdebug (this last one is deactivated by default, run `phpenmod xdebug` and restart Apache to enable it).

Extensions mcrypt and mongo are also present on PHP 7.1 and previous versions.

It is intended to be used [httpd](https://hub.docker.com/_/httpd) with FCGI enable or [nginx](https://hub.docker.com/_/nginx). The PHP FPM daemon is configured with "docker" as user and group, and listens to the port `9001`.

**This image does not contain Akeneo PIM**.

## Supported tags and corresponding `Dockerfile` links

- `php-7.2`, `latest` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/fpm/7.2/Dockerfile): The environment comes with Debian 9 (Stretch) with PHP 7.1 from [Sury repository](https://deb.sury.org/)
- `php-7.1` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/fpm/7.1/Dockerfile): The environment comes with Debian 9 (Stretch) with PHP 7.1 from [Sury repository](https://deb.sury.org/)
- `php-7.0` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/fpm/7.0/Dockerfile): The environment comes with Debian 9 (Stretch) with native PHP 7.0
- `php-5.6` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/fpm/5.6/Dockerfile): The environment comes with Debian 8 (Jessie) with native PHP 5.6

## How to use it

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/akeneo/apache-php/) by running:

```bash
$ docker run -d --name akeneo-fpm akeneo/fpm
```

### Build the image from GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t akeneo/fpm .
```

Full documentation is accessible [here](https://github.com/akeneo/Dockerfiles#how-to-use-these-images)

## License

This image is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

# Akeneo Dockerfiles

[![Build Status](https://travis-ci.org/akeneo/Dockerfiles.svg?branch=master)](https://travis-ci.org/akeneo/Dockerfiles)

This repository contains the Dockerfiles we use for Akeneo PIM and other PHP or Symfony development/testing. Feel free to use/adapt them if they fit your needs.

**These images do not contain Akeneo PIM**.

## Images available

- [**akeneo/php**](php/README.md): Base image with PHP CLI preconfigured, based on `debian:jessie-slim` or `debian:stretch-slim`
- [**akeneo/fpm**](fpm/README.md): An image with PHP FPM preconfigured to be used with any PHP project, based on `akeneo/php` (needs to be run along `nginx` or `httpd`)
- [**akeneo/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured to be used with any PHP project, based on `akeneo/php`

All images are available as follow:

| PHP version | Based on                                                                                     | Corresponding tags        |
|-------------|----------------------------------------------------------------------------------------------|---------------------------|
| 5.6         | Debian 8 "Jessie" with native PHP package                                                    | akeneo/php:5.6            |
|             |                                                                                              | akeneo/fpm:php-5.6        |
|             |                                                                                              | akeneo/apache-php:php-5.6 |
| 7.0         | Debian 9 "Stretch" with native PHP packages                                                  | akeneo/php:7.0            |
|             |                                                                                              | akeneo/fpm:php-7.0        |
|             |                                                                                              | akeneo/apache-php:php-7.0 |
| 7.1         | Debian 9 "Stretch" with packages coming from [Ondřej Surý repository](https://deb.sury.org/) | akeneo/php:7.1            |
|             |                                                                                              | akeneo/fpm:php-7.1        |
|             |                                                                                              | akeneo/apache-php:php-7.1 |

For all images, images tagged `latest` are identical to those using the most recent PHP version.

**Please, remember that, for the moment, only Apache + mod_php, with PHP 5.6, is officially supported by Akeneo.**

## How to use these images

If you are new to Docker, please start with the [getting started section](https://github.com/akeneo/Dockerfiles/blob/master/Docs/getting-started.md).
And even if you are not new, it is a good start to understand how these images are intended to be used.

Then, you can find out how to use these images
- for Symfony development in the [Symfony docker-compose section](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/compose.md).
- for Akeneo development and behat testing in the [Akeneo docker-compose section](https://github.com/akeneo/Dockerfiles/blob/master/Docs/akeneo/compose.md).

Please read carefully the [troubleshoothing section](https://github.com/akeneo/Dockerfiles/blob/master/Docs/troubleshooting.md) if you encounter any problem.
If your problem is not listed in it, don't hesitate to [open an issue](https://github.com/akeneo/Dockerfiles/issues).

## License

This content of this repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

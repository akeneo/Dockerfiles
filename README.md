# My Dockerfiles

This repository contains my own docker images I use for Akeneo and other Symfony development. Feel free to use/adapt them if they fit your needs.

| [Master][Master] | [php-7.1][php-7.1] | [php-7.0][php-7.0] | [php-5.6][php-5.6] |
|:----------------:|:----------:|:----------:|:----------:|
| [![Build status][Master image]][Master] | [![Build status][php-7.1 image]][php-7.1] | [![Build status][php-7.0 image]][php-7.0] | [![Build status][php-5.6 image]][php-5.6] |

  [Master image]: https://travis-ci.org/damien-carcel/Dockerfiles.svg?branch=master
  [Master]: https://travis-ci.org/damien-carcel/Dockerfiles/tree/master
  [php-7.1 image]: https://travis-ci.org/damien-carcel/Dockerfiles.svg?branch=php-7.1
  [php-7.1]: https://travis-ci.org/damien-carcel/Dockerfiles/tree/php-7.1
  [php-7.0 image]: https://travis-ci.org/damien-carcel/Dockerfiles.svg?branch=php-7.0
  [php-7.0]: https://travis-ci.org/damien-carcel/Dockerfiles/tree/php-7.0
  [php-5.6 image]: https://travis-ci.org/damien-carcel/Dockerfiles.svg?branch=php-5.6
  [php-5.6]: https://travis-ci.org/damien-carcel/Dockerfiles/tree/php-5.6

## Images available

- [**carcel/php**](php/README.md): Base image with PHP CLI preconfigured, based on `debian:jessie-slim`
- [**carcel/fpm**](fpm/README.md): Base image with PHP FPM preconfigured, based on `carcel/php`
- [**carcel/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured, based on `carcel/php`
- [**carcel/akeneo**](akeneo/README.md): An image for Akeneo development, based on `carcel/apache-php`
- [**carcel/akeneo-behat**](akeneo-behat/README.md): An image to run Akeneo behat tests, based on `carcel/apache-php`
- [**carcel/akeneo-fpm**](akeneo-fpm/README.md): An image for Akeneo development with PHP FPM (to be used with `carcel/akeneo-nginx`), based on `carcel/fpm`
- [**carcel/akeneo-behat-fpm**](akeneo-behat-fpm/README.md): An image to run Akeneo behat tests with PHP FPM (to be used with `carcel/akeneo-behat-nginx`), based on `carcel/fpm`

## How to use these images?

Find out how to use these images with `docker-compose` [here](https://github.com/damien-carcel/Dockerfiles/blob/master/COMPOSE.md).

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

# Akeneo Dockerfiles

This repository contains the Dockerfiles we use for Akeneo PIM and other PHP or Symfony development/testing. Feel free to use/adapt them if they fit your needs.

**These images do not contain Akeneo PIM**.

| [php-7.0][php-7.0] | [php-5.6][php-5.6] |
|:------------------:|:------------------:|
| [![Build status][php-7.0 image]][php-7.0] | [![Build status][php-5.6 image]][php-5.6] |

  [php-7.0 image]: https://travis-ci.org/akeneo/Dockerfiles.svg?branch=php-7.0
  [php-7.0]: https://travis-ci.org/akeneo/Dockerfiles/tree/php-7.0
  [php-5.6 image]: https://travis-ci.org/akeneo/Dockerfiles.svg?branch=php-5.6
  [php-5.6]: https://travis-ci.org/akeneo/Dockerfiles/tree/php-5.6

## Images available

- [**akeneo/php**](php/README.md): Base image with PHP CLI preconfigured, based on `debian:stretch-slim`
- [**akeneo/fpm**](fpm/README.md): An image with PHP FPM preconfigured to be use with any PHP project, based on `akeneo/php`
- [**akeneo/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured to be use with any PHP project, based on `akeneo/php`

## How to use these images?

Find out how to use these images with `docker-compose` [here](https://github.com/akeneo/Dockerfiles/blob/master/Docs/getting-started.md).

## License

This repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

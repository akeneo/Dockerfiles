# My Dockerfiles

This repository contains the Dockerfiles I use for Akeneo and other Symfony development. Feel free to use/adapt them if they fit your needs.

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
- [**carcel/fpm**](fpm/README.md): An image with PHP FPM preconfigured to be use with any Symfony project, based on `carcel/php`
- [**carcel/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured to be use with any Symfony project, based on `carcel/php`

## How to use these images?

Find out how to use these images with `docker-compose` [here](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/compose.md).

## License

This repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/damien-carcel/Dockerfiles/blob/master/LICENSE) file.

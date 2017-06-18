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

### Maintained

- [**carcel/php**](php/README.md): Base image with PHP CLI preconfigured, based on `debian:jessie-slim`
- [**carcel/fpm**](fpm/README.md): An image with PHP FPM preconfigured to be use with any Symfony project, based on `carcel/php`
- [**carcel/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured to be use with any Symfony project, based on `carcel/php`
- [**carcel/akeneo-apache**](https://github.com/damien-carcel/Dockerfiles/tree/php-5.6/akeneo-apache/README.md): An image for Akeneo development with Apache + mod_php, based on `carcel/apache-php`
- [**carcel/akeneo-fpm**](akeneo-fpm/README.md): An image for Akeneo development with PHP FPM, based on `carcel/fpm`

### Unmaintained

- **carcel/akeneo** and **carcel/akeneo-behat** have been replaced by **carcel/akeneo-apache**.

## GitHub branches and corresponding Docker Hub tags

### Maintained

Four branches are maintained, all based on [debian:jessie](https://hub.docker.com/_/debian/):

- `php-5.6` branch provides images with native Jessie PHP 5.6. Corresponding tag is `php-5.6`, except for `carcel/php` and `carcel/fpm` images, which simply use the tag `5.6`.
- `php-7.0` branch provides images with PHP 7.0 from [Sury](https://deb.sury.org/) repository. Corresponding tag is `php-7.0`, except for `carcel/php` and `carcel/fpm` images, which simply use the tag `7.0`.
- `php-7.1` branch provides images with PHP 7.1 from [Sury](https://deb.sury.org/) repository. Corresponding tag is `php-7.1`, except for `carcel/php` and `carcel/fpm` images, which simply use the tag `7.1`.
- `master` branch images correspond to the tag `latest`, and are exactly the same than images with `php-7.1` tag.

- `carcel/akeneo-apache` is maintained only for tag `php-5.6`.
- `carcel/akeneo-fpm` is maintained only for tag `php-7.1` and further (`master` included).

**Please, remember that, for the moment, only Apache + mod_php, with PHP 5.6, is officialy supported by Akeneo.**

### Unmaintained

- `php-5.4` branch provides only `carcel/php` image with tag `5.4`. This branch is not maintained, and kept only for testing purposes with Akeneo 1.5 and previous.
- `php-5.5` branch provides only `carcel/php` image with tag `5.5`. This branch is not maintained, and kept only for testing purposes with Akeneo 1.5 and previous.

- `carcel/akeneo-apache` images tagged `php-7.0`, `php-7.1` and `latest` are not maintained.
- `carcel/akeneo-fpm` images tagged `php-5.6` and `php-7.0` are not maintained.

## How to use these images?

If you are new to Docker, please start with the [getting started section](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/getting-started.md).

Then, you can find out how to use these images
- for Symfony development in the [Symfony docker-compose section](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/symfony/compose.md).
- for Akeneo development and behat testing in the [Akeneo docker-compose section](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/akeneo/compose.md).

Please read carefully the [troubleshoothing section](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/troubleshooting.md) if you encounter any problem.
If your problem is not listed in it, don't hesitate to [open an issue](https://github.com/damien-carcel/Dockerfiles/issues).

## License

This content of this repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/damien-carcel/Dockerfiles/blob/master/LICENSE) file.

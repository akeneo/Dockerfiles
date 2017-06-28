# My Dockerfiles

This repository contains the Dockerfiles I use for Akeneo and other Symfony development. Feel free to use/adapt them if they fit your needs.

| [Master][Master] | [php-7.1][php-7.1] | [php-5.6][php-5.6] |
|:----------------:|:----------:|:----------:|:----------:|
| [![Build status][Master image]][Master] | [![Build status][php-7.1 image]][php-7.1] | [![Build status][php-5.6 image]][php-5.6] |

  [Master image]: https://travis-ci.org/akeneo/Dockerfiles.svg?branch=master
  [Master]: https://travis-ci.org/akeneo/Dockerfiles/tree/master
  [php-7.1 image]: https://travis-ci.org/akeneo/Dockerfiles.svg?branch=php-7.1
  [php-7.1]: https://travis-ci.org/akeneo/Dockerfiles/tree/php-7.1
  [php-5.6 image]: https://travis-ci.org/akeneo/Dockerfiles.svg?branch=php-5.6
  [php-5.6]: https://travis-ci.org/akeneo/Dockerfiles/tree/php-5.6

## Images available

- [**akeneo/php**](php/README.md): Base image with PHP CLI preconfigured, based on `debian:stretch-slim`
- [**akeneo/fpm**](fpm/README.md): An image with PHP FPM preconfigured to be use with any Symfony project, based on `akeneo/php`
- [**akeneo/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured to be use with any Symfony project, based on `akeneo/php`
- [**akeneo/akeneo-apache**](https://github.com/akeneo/Dockerfiles/tree/php-5.6/akeneo-apache/README.md): An image for Akeneo development with Apache + mod_php, based on `akeneo/apache-php`
- [**akeneo/akeneo-fpm**](akeneo-fpm/README.md): An image for Akeneo development with PHP FPM, based on `akeneo/fpm`

## GitHub branches and corresponding Docker Hub tags

Four branches are maintained, all based on [debian:jessie](https://hub.docker.com/_/debian/):

- `php-5.6` branch provides images with native Jessie PHP 5.6. Corresponding tag is `php-5.6`, except for `akeneo/php` and `akeneo/fpm` images, which simply use the tag `5.6`.
- `php-7.1` branch provides images with PHP 7.1 from [Sury](https://deb.sury.org/) repository. Corresponding tag is `php-7.1`, except for `akeneo/php` and `akeneo/fpm` images, which simply use the tag `7.1`.
- `master` branch images correspond to the tag `latest`, and are exactly the same than images with `php-7.1` tag.

- `akeneo/akeneo-apache` is maintained only for tag `php-5.6`.
- `akeneo/akeneo-fpm` is maintained only for tag `php-7.1` and further (`master` included).

**Please, remember that, for the moment, only Apache + mod_php, with PHP 5.6, is officially supported by Akeneo.**

## How to use these images?

If you are new to Docker, please start with the [getting started section](https://github.com/akeneo/Dockerfiles/blob/master/Docs/getting-started.md).
And even if you are not new, it is a good start to understand how these images are intended to be used.

Then, you can find out how to use these images
- for Symfony development in the [Symfony docker-compose section](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/compose.md).
- for Akeneo development and behat testing in the [Akeneo docker-compose section](https://github.com/akeneo/Dockerfiles/blob/master/Docs/akeneo/compose.md).

Please read carefully the [troubleshoothing section](https://github.com/akeneo/Dockerfiles/blob/master/Docs/troubleshooting.md) if you encounter any problem.
If your problem is not listed in it, don't hesitate to [open an issue](https://github.com/akeneo/Dockerfiles/issues).

## License

This content of this repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

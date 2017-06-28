# Akeneo PIM server with Docker

Akeneo stack is also available as a Docker image, provided and maintained by Akeneo.

Akeneo provides open-source support for this Dockerfiles via the akeneo/Dockerfiles GitHub repository. Akeneo stack's technical documentation, server prerequisites and cookbooks is available here: https://docs.akeneo.com

## What is Akeneo PIM?

[Akeneo](https://www.akeneo.com) is an open source Product Information Management (PIM) solution that centralizes and harmonizes all marketing and technical information for product listings and catalogs. [Akeneo PIM source code](https://github.com/akeneo/pim-community-standard) is released under open source license. Based on the Symfony2 framework, this solution is highly customizable and extensible.

## What do we share here

This repository contains the Dockerfiles proposed for Akeneo PIM. Feel free to use/adapt them if they fit your needs.

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

### Maintained

- [**akeneo/php**](php/README.md): Base image with PHP CLI preconfigured, based on `debian:jessie-slim`
- [**akeneo/fpm**](fpm/README.md): An image with PHP FPM preconfigured to be use with any Symfony project, based on `akeneo/php`
- [**akeneo/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured to be use with any Symfony project, based on `akeneo/php`
- [**akeneo/akeneo-apache**](https://github.com/akeneo/Dockerfiles/tree/php-5.6/akeneo-apache/README.md): An image for Akeneo development with Apache + mod_php, based on `akeneo/apache-php`
- [**akeneo/akeneo-fpm**](akeneo-fpm/README.md): An image for Akeneo development with PHP FPM, based on `akeneo/fpm`

### Unmaintained

- **akeneo/akeneo** and **akeneo/akeneo-behat** have been replaced by **akeneo/akeneo-apache**.

### Where to get help:

The Akeneo Community [forum](https://www.akeneo.com/forums/), the Akeneo Community [Slack](https://akeneopim-ug.herokuapp.com)

### Where to file issues:

https://github.com/akeneo/Dockerfiles/issues

### Maintainance

This repo is maintained by the Akeneo Community and the Akeneo Team. Contributions and feedbacks are welcome ver welcome, through this Github repository: https://github.com/akeneo/Dockerfiles

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

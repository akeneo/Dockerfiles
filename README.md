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
- [**carcel/fpm**](fpm/README.md): An image with PHP FPM preconfigured to be use with any Symfony project, based on `carcel/php`
- [**carcel/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured to be use with any Symfony project, based on `carcel/php`
- [**carcel/akeneo**](akeneo/README.md): An image for Akeneo development, based on `carcel/apache-php`
- [**carcel/akeneo-behat**](akeneo-behat/README.md): An image to run Akeneo behat tests, based on `carcel/apache-php`
- [**carcel/akeneo-fpm**](akeneo-fpm/README.md): An image for Akeneo development with PHP FPM, based on `carcel/fpm`
- [**carcel/nginx**](nginx/README.md): An image with nginx preconfigured (to use with FPM images), based on official `nginx`

## Tags available

Four branches are maintained, all based on [debian:jessie](https://hub.docker.com/_/debian/):

- `php-5.6` provides images with native Jessie PHP 5.6. Corresponding tag is `php-5.6`, except for `carcel/php` and `carcel/fpm` images, which simply use the tag `5.6`.
- `php-7.0` provides images with native Jessie PHP 5.6. Corresponding tag is `php-7.0`, except for `carcel/php` and `carcel/fpm` images, which simply use the tag `7.0`.
- `php-7.1` provides images with native Jessie PHP 5.6. Corresponding tag is `php-7.1`, except for `carcel/php` and `carcel/fpm` images, which simply use the tag `7.1`.
- `master` provides images with native Jessie PHP 5.6. Corresponding tag is `latest`, and its images are exactly the same than `php-7.1` tag.
    `nginx` image is only present on master branch, and so only available with the tag `latest`.

## How to use these images?

If you are new to Docker, please start with the [getting started section](https://github.com/damien-carcel/Dockerfiles/blob/master/GETTING-STARTED.md).

Then, you can find out how to use these images for Akeneo development and testing in the [Docker compose section](https://github.com/damien-carcel/Dockerfiles/blob/master/COMPOSE.md).

Please read carefully the [troubleshoothing section](https://github.com/damien-carcel/Dockerfiles/blob/master/TROUBLESHOOTING.md) if you encounter any problem.
If your problem is not listed in it, don't hesitate to [open an issue](https://github.com/damien-carcel/Dockerfiles/issues).

## License

This content of this repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/damien-carcel/Dockerfiles/blob/master/LICENSE) file.

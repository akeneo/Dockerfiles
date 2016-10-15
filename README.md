# My Dockerfiles

This repository contains my own docker images I use for work and personal projects. Feel free to use/adapt them if they fit your needs.

Are included:

- [**carcel/php**](php/README.md): Base image with PHP CLI preconfigured
- [**carcel/fpm**](fpm/README.md): Base image with PHP FPM preconfigured, based on `carcel/php`
- [**nginx/fpm**](nginx/README.md): An image with nginx preconfigured, based on official `nginx`
- [**carcel/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured, based on `carcel/php`
- [**carcel/akeneo**](akeneo/README.md): An image for Akeneo development, based on `carcel/apache-php`
- [**carcel/akeneo-behat**](akeneo-behat/README.md): An image to run Akeneo behat tests, based on `carcel/apache-php`

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

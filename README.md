# My Dockerfiles

This repository contains my own docker images I use for work and personal projects. Feel free to use/adapt them if they fit your needs.

Are included:

- [**carcel/php**](php/README.md): Base image with PHP CLI preconfigured
- [**carcel/fpm**](fpm/README.md): Base image with PHP FPM preconfigured, based on `carcel/php`
- [**nginx/fpm**](nginx/README.md): Base image with nginx preconfigured, based on official `nginx`
- [**carcel/apache-php**](apache-php/README.md): An image with Apache + mod_php preconfigured, based on `carcel/php`
- [**carcel/akeneo**](akeneo/README.md): An image for Akeneo development, based on `carcel/apache-php`
- [**carcel/akeneo-behat**](akeneo-behat/README.md): An image to run Akeneo behat tests, based on `carcel/apache-php`
- [**carcel/akeneo-nginx**](akeneo-nginx/README.md): An image for Akeneo development, with nginx preconfigured (to be used with `carcel/akeneo-fpm`), based on `carcel/nginx`
- [**carcel/akeneo-behat-nginx**](akeneo-behat-nginx/README.md): An image to run Akeneo behat tests, with nginx preconfigured (to be used with `carcel/akeneo-behat-fpm`), based on `carcel/nginx`
- [**carcel/akeneo-fpm**](akeneo/README.md): An image for Akeneo development with PHP FPM (to be used with `carcel/akeneo-nginx`), based on `carcel/fpm`
- [**carcel/akeneo-behat-fpm**](akeneo-behat/README.md): An image to run Akeneo behat tests with PHP FPM (to be used with `carcel/akeneo-behat-nginx`), based on `carcel/fpm`

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

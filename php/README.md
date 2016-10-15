# PHP CLI on Docker

This is a basic Docker environment for PHP development, based on [debian:jessie](https://hub.docker.com/_/debian/).

It is not intended to use directly as it stands, but rather to extend it and create custom development environments.

The environment comes with native Debian Jessie PHP 5.6, and some PHP extensions: apcu, mcrypt, intl, mysql, curl, gd, mongo, and xdebug (this last one comes deactivated, run `php5enmod xdebug` to enable it).

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

# PHP CLI on Docker

This is a basic Docker environment for PHP development.
It is not intended to use directly as it stands, but rather to extend it and create custom development environments.

The environment come with PHP 7.0 from "dotdeb.org", based on Debian Jessie, and some PHP extensions: apcu, mcrypt,
intl, mysql, curl, gd, mongo, soap, xml, zip and xdebug (this last one comes deactivated, run `phpenmod xdebug` to
enable it).

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

# Changelog

## 2019-01-14

### Enhancement

- Issue-330: Add new `akeneo/node` 8 and 10 images.

## 2019-01-14

### Enhancement

 - Issue-334: Removes unused SOAP PHP extension from 7.2 images, as it's not used by Akeneo 3.x.

## 2018-08-18

### Bug fix

- **Issue 323**: Set timezone to `UTC` and increase `post_max_size` so it is larger than `upload_max_filesize`.

## 2018-02-23

### Enhancement

- **Issue 283**: Add PHP 7.2 for CLI and FPM (no more new Apache + mod_php image).

## 2018-02-13

### Enhancement

- **Issue 283**: Move PHP 7.1 Dockerfiles into their own folder.
- **Issue 288**: Set `error_reporting` to `E_ALL`.
                 Externalize Akeneo specific configuration into `akeneo.ini` PHP configuration file.

## 2018-01-10

### Enhancement

- **Issue 118**: Introduce a testing architecture.

## 2017-10-23

### Bug fix

- **Issue 305**: Revert the removal of "sudo" in command, so the container can still be run by `docker` user.

### Enhancement

- **Issue 303**: Remove user docker on php, fpm and apache-php (all tags).

## 2017-10-10

### Enhancement

- **Issue 297**: Add make to all images.

## 2017-10-09

### Enhancement

- **Pull request 298**: Add PHP LDAP extension in all images. Thanks @jmleroux!

## 2017-08-18

### Enhancements

- **Issue 284**: Move all images tags on master branch.
- **Issue 285**: Enable APC for command line on PHP 7.1.

## 2017-07-17

### Enhancements

- **Issue 265**: Remove `akeneo/akeneo-apache` and `akeneo/akeneo-fpm` images.
                 Remove usage of `gosu` in PHP 5.6 images.
- **Issue 277**: Bring back PHP 7.0 images.

## 2017-06-27

### Enhancement

- **Issue 243**: Update branches `php-7.1` and `master` to `debian:stretch-lite`.

## 2017-06-26

### Enhancement

- **Issue 260**: Move images from namespace `carcel` to `akeneo`.

## 2017-06-24

### Enhancement

- **Issue 254**: Clear folders created by webpack (`web/cache` and `web/dist`) before PIM install.

## 2017-06-19

### Documentation

- **Issue 251**: Fix Akeneo FPM compose file indentation.

## 2017-06-17

### Documentation

- **Issue 224**: Add usage of NodeJS and NPM in the Akeneo FPM compose file.
- **Issue 225**: Update compose file for Akeneo FPM, to be used with MySQL 5.7 and Elasticsearch 5.x (no more MongoDB).
- **Issue 226**: Set composer home folder in compose file and better document composer settings.

### Enhancements

- **Issue 199**: Remove `carcel/akeneo-fpm` from PHP 5.6 and 7.0.
    Remove `carcel/akeneo-apache` from PHP 7.0 and following.
- **Issue 234**: Remove `carcel/nginx` image (official `nginx` image is to be used instead).

## 2017-06-13

### Documentation

- **Issue 132**: Adds CONTRIBUTING.md and GitHub templates (issues and pull requests).

## 2017-06-05

### Enhancement

- **Issue 216**: Fuse `carcel/akeneo` and `carcel/akeneo-behat` into `carcel/akeneo-apache`.

## 2017-05-22

### Enhancement

- **Issue 212**: Add `bcmath` extension to PHP 7.x images

## 2017-05-11

### Bug fix

- **Issue 200**: Fix XDebug activation/deactivation.

## 2017-05-08

### Enhancements

- **Issue 185**: Make the vhosts and nginx servers more generic.
    All base images now expect the web application to be in `/home/docker/application`,
    and Akeneo images in `/home/docker/pim`.
- **Issue 188**: Increase nginx client max body size to 20 MB (like for FPM).

## 2017-04-26

### Enhancement

- **Issue 187**: Add MySQL and MongoDB clients (available for all images).

## 2017-03-04

### Enhancement

- **Issue 179**: Manage "test" environment in the helpers (`pim-cac`, `pim-assets`, `pim-initialize`) of Akeneo images.

## 2017-02-25

### Documentation

- **Issue 160**: Improve the documentation for people who have none or very few knowledge of Docker.

## 2017-02-23

### Bug fix

- **Issue 167**: Set `date.timezone` to `Etc/UTC` instead of `Europe/Paris`.

### Enhancement

- **Issue 168**: Rename asset script into `pim-assets`.

## 2017-02-14

### Enhancement

- **Issue 141**: Make `apache-php` image usable as it is.
    Application is now placed in `/home/docker/symfony` in the containers.

## 2017-02-13

### Bug fixes

- **Issue 154**: Minor fixes in compose examples.
- **Issue 155**: Removes all caches in `akeneo-fpm` image.

## 2017-02-12

### Enhancements

- **Issue 31**: Use `debian:jessie-slim` as base image,
    and perform the same cleaning on documentation after package installation.
- **Issue 66**: Remove npm and grunt from akeneo images
    (use dedicated images for that, like [digitallyseamless](https://hub.docker.com/u/digitallyseamless/) images).
- **Issue 115**: Configure `carcel/fpm` to use port 9001 instead of socket
    and remove images `carcel/akeneo-nginx` and `carcel/akeneo-behat-nginx`.
- **Issue 116**: Remove `carcel/akeneo-behat-fpm` image.
- **Issue 131**: Replace Dotdeb repositories by Sury ones for php-7.0 images.

## 2017-02-05

### Documentation

- **Issue 124**: Complete the documentation and put it on master only.

## 2017-01-21

### Bug fix

- **Issue 125**: Fix wrong path for FPM PID/socket in `carcel/fpm`, for `php-7.1` and `master` branches.

## 2017-01-05

### Enhancement

- **Issue 24**: Add a basic CI on Travis (ensure all images can be built before merge).

## 2016-12-21

### Bug fix

- **Issue 110**: Add missing "user" option in compose files.

### Enhancements

- **Issue 106**: Enhance compose examples and documentation.
- **Issue 108**: Enhance helper commands.

## 2016-12-18

### Bug fix

- **Issue 75**: Allow to properly restart apache container by removing `/var/run/apache2/apache2.pid` in
    `carcel/apache-php` image entry point. 

### Enhancements

- **Issue 99**: Deactivate Xdebug by default.
- **Issue 100**: Add a script to easily perform "cache:clear" on Akeneo. Assets are also dumped as symlinks now.

## 2016-12-12

### Enhancements

- **Issue 88**: Allow user to config Xdebug from environment variables.
- **Issue 89**: Introduce `php-7.1` branch containing PHP 7.1 based images.
    PHP 7.1 packages are provided by [Sury](https://packages.sury.org//) repositories. Master is updated to PHP 7.1 too.
    
## 2016-12-05

### Enhancement

- **Issue 74**: Add a default Xdebug configuration in `carcel/php` image.

## 2016-11-28

### Bug fixes

- **Issue 62**: Improve package install and cleaning.
- **Issue 68**: Update compose documentation.

### Enhancement

- **Issue 66**: Add npm and grunt on akeneo development images (needed to run JavaScript and CSS static analysis).

## 2016-11-21

### Documentation

- Fix some broken links in documentation.

## 2016-11-15:

### Bug fix

- **Issue 35**: Add missing `php7.0-mbstring` package.

## 2016-10-31

### Documentation

- **Issue 53**: Reorganize documentation (minimalist READMEs, all important documentation in `COMPOSE.md`).

## 2016-10-22

### Bug fixes

- **Issue 51**: Fix an issue when running behat tests (add missing environment variable and volume sharing in compose
    examples).
- **Issue 52**: Add `perceptualdiff` package in behat images (required to run Akeneo Enterprise Edition behats).

## 2016-10-15

### Enhancements

- **Issue 22**: Add `carcel/akeneo-fpm` and `carcel/akeneo-behat-fpm` images (based on `carcel/fpm`),
    and `carcel/akeneo-nginx` and `carcel/akeneo-behat-nginx` (based on `carcel/nginx`).
- **Issue 23**: Add `carcel/nginx` image.

### Bug fixes

- **Issue 34**: Fix user declaration in Dockerfiles by placing it at the end.
- **Issue 36**: Raise PHP upload size limit to 20 MB.
- **Issue 37**: Fix Selenium container usage in compose file example.
- **Issue 45**: Fix an issue with composer installation during `carcel/php` image build.

## 2016-10-09

### Enhancements

- **Issue 5**: Add `carcel/fpm` image (extends `carcel/php`). Introduce a new docker compose file example dedicated to FPM.
- **Issue 20**: Split `carcel/apache-php` image to introduce a new `carcel/php` image (the first one extends the second).

## 2016-10-08

### Enhancement

- **Issue 4**: Introduce `php-7.0` branch, containing PHP 7.0 based images.
    PHP 7.0 packages are provided by [Dotdeb](https://www.dotdeb.org/) repositories.
    Master contains the same PHP 7.0 images.
    Original PHP 5.6 images (Debian Jessie native packages) are now in the `php-5.6` branch.
    All files used by dockerfiles are now placed in a `files` subfolder.
    
## 2016-10-07

### Enhancement

- **Issue 13**: Add images `carcel/akeneo` and `carcel/akeneo-behat`.
    These new images extends the original one, which is now known as `carcel/apache-php` image.
    Each image is in its own subfolder, with its own README. A compose file example was added.

## 2016-10-03

### Enhancement

- Optimize packages installation and cleanup to reduce image size.

## 2016-09-25

### Enhancement

- **Issue 6**: Run only Apache daemon as foreground process. MySQL and MongoDB are removed and to be launched in other containers.

## 2016-08-22

### Enhancement

- **Issue 1**: Add imagemagick and its php extension.

## Initial commit (2016-08-15)

- One dockerfile providing a complete LAMP environment, based on `debian/jessie` image.
    Processes are launched through `supervisord`.

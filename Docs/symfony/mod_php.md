# Symfony with Apache + mod_php

## Using the images

Just copy the [Apache compose file](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/docker-compose.yml.apache_dist) to the root of your project (don't forget to rename it `docker-compose.yml`).

The application is mounted into a data volume by the compose file, as follow:
```yaml
services:
  apache:
    image: akeneo/apache-php
    user: docker
    volumes:
      - ./:/srv/application
```

**Important**: As the application is shared between your host and the FPM container, it is mandatory on Linux that your user ID and group ID are `1000`,
as it is for the `docker` user inside the container. Without that, you'll end up with a permission mess that will prevent your application from running.
This is not a problem on Windows and Mac OX as both are using a virtual machine to run Docker, with user and group IDs `1000`.

By default, latest version of `akeneo/apache-php` is used in the compose file. But you can also choose to use a specific tag.
[Look here](https://github.com/akeneo/Dockerfiles/blob/master/README.md#github-branches-and-corresponding-docker-hub-tags) to know all available tags.

## Run and stop the containers

**All `docker-compose` commands are to be ran from the folder containing the compose file.**

To start your containers, just run:

```bash
$ docker-compose up -d
```

To stop the containers, run:

```bash
$ docker-compose stop
```

but if you want to completely remove everything (containers, networks and volumes), then run:

```bash
$ docker-compose down -v
```

This, of course, will not delete the application you cloned on your machine, only the Docker containers. 

## Install and run Symfony

### Configure Symfony

First, make sure that the database settings are as the containers expect them:

```yaml
# /host/path/to/you/pim/app/config/parameters.yml
parameters:
    database_driver: pdo_mysql
    database_host: mysql
    database_port: null
    database_name: symfony
    database_user: symfony
    database_password: symfony
    locale: en
    secret: ThisTokenIsNotSoSecretChangeIt
```

### Configure Apache

`akeneo/apache-php` comes with Apache preconfigured, except for the virtual host, which is the default one coming with Debian.
This virtual host will look for application in `/var/www/html`, which can be fine if you're using a simple PHP application with `index.html` or `index.php` as entry point.

However, for a Symfony application, you need to create a more sophisticated virtual host and use it in the container.
You should use the web server configuration [recommended by Symfony](https://symfony.com/doc/current/setup/web_server_configuration.html),
and mount your it as a data volume to replace Debian default web server configuration:

```yaml
version: '2'

services:
  apache:
    volumes:
      - ./docker/vhost.conf:/etc/apache2/sites-available/000-default.conf
```

Then just up the containers again to acknowledge your changes:

```bash
$ docker-compose up -d
```

### Install Symfony

Now, you can install vendors (if needed):

```bash
$ docker-compose exec apache composer update
```

You should now be able to access your application from your host through `http://localhost:8080/` (of course, you can change the host port in the compose file).

## Advanced configuration

### Composer

You can set the composer home with the following environment variable:
```yaml
services:
  apache:
    environment:
      COMPOSER_HOME: '/home/docker/.composer'`
```

This will ensure where `composer` keeps its data inside the container, and allow you to safely map your own composer home folder,
sharing both your configuration (including your GitHub token, which is mandatory to install Akeneo PIM standard and/or enterprise edition)
and your composer cache (and so reducing considerably the dependencies installation time):
```yaml
services:
  apache:
    volumes:
      - ~/.composer:/home/docker/.composer
```

Beware that on recent Linux system, `composer` cache and configuration are usually separated in `.cache/composer` and `.config/composer`.
You then need to adapt the environment variables of your compose file as follow:
```yaml
services:
  apache:
    environment:
      COMPOSER_CACHE_DIR: '/home/docker/.cache/composer'
      COMPOSER_HOME: '/home/docker/.config/composer'
    volumes:
      - ~/.cache/composer:/home/docker/.cache/composer
      - ~/.config/composer:/home/docker/.config/composer
```

### Xdebug

*Xdebug* is deactivated by default. If you want to activate it, you need to set the following environment variables:
```yaml
services:
  apache:
    environment:
      PHP_XDEBUG_ENABLED: 1
      XDEBUG_CONFIG: 'your host IP address'
```

Then you just have to run `docker-compose up -d` again and XDebug will be activated.

Also, you can configure a few more parameters through environment variables (all optional).
- `PHP_XDEBUG_IDE_KEY`: the IDE KEY you want to use (by default `XDEBUG_IDE_KEY`)
- `PHP_XDEBUG_REMOTE_HOST`: your host IP address (again), this one is needed only if the docker daemon run on TCP instead of unix domain socket (on Mac OS for instance)

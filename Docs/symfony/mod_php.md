# Symfony with Apache + mod_php

## Using the images

The simplest way to run the containers is to copy the [Apache compose file](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/docker-compose.yml.apache_dist) at the root of your project (don't forget to rename it `docker-compose.yml`).

You can place it somewhere else, but then you will need to change the volumes parameter from `./:/srv/application` to `/the/path/to/your/application:/srv/application`.

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

### Xdebug

*Xdebug* is deactivated by default. If you want to activate, you can turn the environment variable `PHP_XDEBUG_ENABLED` to `1`. Then you just have to run `docker-compose up -d` again.

Also, you can configure two things on Xdebug through environment variables. These environment variables are all optional.
- `PHP_XDEBUG_IDE_KEY`: the IDE KEY you want to use (by default `XDEBUG_IDE_KEY`)
- `PHP_XDEBUG_REMOTE_HOST`: your host IP address (by default it allows all IPs)

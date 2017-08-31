# Symfony with PHP FPM and Nginx

## Using the images

The simplest way to run the containers is to copy the [FPM compose file](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/docker-compose.yml.fpm_dist) at the root of your project (don't forget to rename it `docker-compose.yml`).

You can place it somewhere else, but then you will need to change the volumes parameter from `./:/srv/application` to `/the/path/to/your/application:/srv/application`.

By default, latest version of `akeneo/fpm` is used in the compose file. But you can also choose to use a specific tag.
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

### Configure nginx

Unlike `akeneo/apache-php` image, which contains PHP **and** Apache, `akeneo/fpm` image contains only PHP-FPM.
So to be able to access your application in a web browser, you need to associate the FPM container with a nginx one (you could use Apache with mod FCGI too).

You can use the official `nginx` image available on [Docker Hub](https://hub.docker.com/_/nginx/). The [FPM compose file](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/docker-compose.yml.fpm_dist) already defines the appropriate service.
You just need to copy the [nginx server configuration](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/nginx.conf) to the appropriate folder.
The compose file expects it in a `docker` subfolder of your project, but it is up to you to choose another folder.

Optionally, you can also add a [configuration file](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/upload.conf) to set the maximum size of uploaded files (the nginx service of the compose file is already set for it).

### Install Symfony

You can install vendors (if needed) by running:

```bash
$ docker-compose exec fpm composer update
```

You should now be able to access your application from your host through `http://localhost:8080/` (of course, you can change the host port in the compose file).

### Xdebug

*Xdebug* is deactivated by default. If you want to activate, you can turn the environment variable `PHP_XDEBUG_ENABLED` to `1`. Then you just have to run `docker-compose up -d` again.

Also, you can configure two things on Xdebug through environment variables. These environment variables are all optional.
- `PHP_XDEBUG_IDE_KEY`: the IDE KEY you want to use (by default `XDEBUG_IDE_KEY`)
- `PHP_XDEBUG_REMOTE_HOST`: your host IP address (by default it allows all IPs)

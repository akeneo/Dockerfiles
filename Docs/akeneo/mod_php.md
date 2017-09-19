# Akeneo with Apache + mod_php

**Reminder: all the information in this page is for Akeneo PIM 1.7 and previous versions.**

For versions next to 1.7, please have a look [here](https://github.com/akeneo/Dockerfiles/blob/master/Docs/akeneo/fpm.md).

## Using the images

A compose file template is already present both in [akeneo/pim-community-dev](https://github.com/akeneo/pim-community-dev/blob/1.7/docker-compose.yml.dist)
and [akeneo/pim-enterprise-dev](https://github.com/akeneo/pim-enterprise-dev/blob/1.7/docker-compose.yml.dist), **from version 1.5 to 1.7**.
You only need to copy it to `docker-compose.yml`.

It is placed by default at the root of your PIM project, but you can place it somewhere else. In this case, you will have to change the volumes parameter from `./:/srv/pim` to `/the/path/to/your/pim:/srv/pim` (you'll need to do it for `akeneo`, `akeneo-behat`, and `selenium` services).

Create on your host a folder `/tmp/behat/screenshots` (or anywhere else according to your compose file) with full read/write access to your user.
Otherwise `docker-compose` will create it, but with write access only for root. Then failing behats will be unable to create screenshots.

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

This, of course, will not delete the Akeneo application you cloned on your machine, only the Docker containers. 

## Install and run Akeneo

### Configure Akeneo

First, make sure that Akeneo database settings are as the containers expect.
As you can see below, the `database_host` is the name of your MySQL service in the compose file.

```yaml
# /host/path/to/you/pim/app/config/parameters.yml
parameters:
    database_driver: pdo_mysql
    database_host: mysql
    database_port: null
    database_name: akeneo_pim
    database_user: akeneo_pim
    database_password: akeneo_pim
    locale: en
    secret: ThisTokenIsNotSoSecretChangeIt
```

```yaml
# /host/path/to/you/pim/app/config/parameters_test.yml
parameters:
    database_driver: pdo_mysql
    database_host: mysql-behat
    database_port: null
    database_name: akeneo_pim
    database_user: akeneo_pim
    database_password: akeneo_pim
    locale: en
    secret: ThisTokenIsNotSoSecretChangeIt
    installer_data: PimInstallerBundle:minimal
```

If you want to use MongoDB storage, add the following to your PIM parameters (like for MySQL, the `mongodb_server` correspond to the name of the MongoDB service in the compose file):

```yaml
# /host/path/to/you/pim/app/config/parameters.yml and parameters.yml.dist ; the last one is important too, to avoid removal on "composer update"
parameters:
    ...
    pim_catalog_product_storage_driver: doctrine/mongodb-odm
    mongodb_server: 'mongodb://mongodb:27017'
    mongodb_database: akeneo_pim
```

```yaml
# /host/path/to/you/pim/app/config/parameters_test.yml
parameters:
    ...
    pim_catalog_product_storage_driver: doctrine/mongodb-odm
    mongodb_server: 'mongodb://mongodb-behat:27017'
    mongodb_database: akeneo_pim
```

For more details on Akeneo configuration, don't hesitate to look at [Akeneo official documentation on the subject](https://docs.akeneo.com/latest/developer_guide/installation/index.html).

### Install Akeneo

Don't forget to activate the `DoctrineMongoDBBundle` in `app/AppKernel.php` if you want to use MongoDB storage.

Now, you can initialize Akeneo. First download all the dependencies with `composer`:

```bash
$ docker-compose exec akeneo php -d memory_limit=-1 /usr/local/bin/composer update
```

Then you can setup the PIM with the following commands:

```bash
$ docker-compose exec akeneo --env=prod pim:install --force
$ docker-compose exec akeneo-behat --env=prod pim:installer:db  # Only with you intend to run behat or integration tests
```

You should now be able to access Akeneo development environment from your host through `http://localhost:8080/` and behat environment through `http://localhost:8081/` (of course, you can change the host port in the compose file).

### Xdebug

*Xdebug* is deactivated by default. If you want to activate, you can turn the environment variable `PHP_XDEBUG_ENABLED` to `1`. Then you just have to run `docker-compose up -d` again.

Also, you can configure two things on Xdebug through environment variables on `akeneo/apache-php` image. These environment variables are all optional.
- `PHP_XDEBUG_IDE_KEY`: the IDE KEY you want to use (by default `XDEBUG_IDE_KEY`)
- `PHP_XDEBUG_REMOTE_HOST`: your host IP address (by default it allows all IPs)

## Run behat tests

The tests are to be run inside the containers. Start by configuring Behat as follows:

```yaml
# /host/path/to/your/pim/behat.yml
default:
    paths:
        features: features
    context:
        class:  Context\FeatureContext
        parameters:
            base_url: 'http://akeneo-behat/'
            timeout: 10000
            window_width: 1280
            window_height: 1024
    extensions:
        Behat\MinkExtension\Extension:
            default_session: symfony2
            show_cmd: chromium-browser %s
            selenium2:
                wd_host: 'http://selenium:4444/wd/hub'
            base_url: 'http://akeneo-behat/'
            files_path: 'features/Context/fixtures/'
        Behat\Symfony2Extension\Extension:
            kernel:
                env: behat
                debug: false
        SensioLabs\Behat\PageObjectExtension\Extension: ~
```

You are now able to run behat tests.

```bash
$ docker-compose exec akeneo-behat bin/behat features/path/to/scenario
```

## What if?

### I want to see my tests running

The docker image `selenium/standalone-firefox-debug` comes with a VNC server in it. You need a VNC client, and to connect to `localhost:5900`. You will then be able to see you browser and your tests running in it!

### I never want to see my tests running

It is the default behavior, but in this case, you don't need to have a VNC server in your selenium container.

You can achieve that simply by replacing the image `selenium/standalone-firefox-debug` by `selenium/standalone-firefox`. The first is based on the second, simply adding the VNC server.

Don't forget to also remove the binding on port 5900, now useless as `selenium/standalone-firefox` does not expose it.
 
### I want to run my tests in Chrome instead of Firefox

Then all you need to do is to replace the image `selenium/standalone-firefox-debug` by `selenium/standalone-chrome-debug` (or `selenium/standalone-chrome` if you don't want to see the browser in action).

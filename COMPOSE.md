# Akeneo development and testing with docker-compose

Two compose file examples are provided, both providing two environments, one for development, the other for running behat tests.

- [**The first compose file**](docker-compose.yml.apache_dist) provides apache + mod_php environments, using [`carcel/akeneo`](https://hub.docker.com/r/carcel/akeneo/) and  [`carcel/akeneo-behat`](https://hub.docker.com/r/carcel/akeneo-behat/).
- [**The second one**](docker-compose.yml.fpm_dist) provides nginx + PHP-FPM, using [`carcel/akeneo-fpm`](https://hub.docker.com/r/carcel/akeneo-fpm/) and  [`carcel/akeneo-behat-fpm`](https://hub.docker.com/r/carcel/akeneo-behat-fpm/).

You can of course create your own compose file, only for behat testing for example, or at the opposite to put everything in on compose file and run both apache + mod_php and nginx + fpm at the same time.

## Configure the images

The simplest way to run the images is to copy one of the compose files at the root of your project (don't forget to rename it `docker-compose.yml`).

You can place it somewhere else, but then you will need to change the volumes parameter from `./:/home/docker/pim` to `/the/path/to/your/pim:/home/docker/pim` (you'll need to do it for both `akeneo` and `akeneo-behat` services, and `nginx` and `nginx-behat` if using PHP-FPM).

Replace `/home/you/.composer` by your own `.composer` folder. This will allow you to use your own github tocken when installing vendors.

Create on your host a folder `/tmp/behat/screenshots` (or anywhere else according to you compose file) with full read/write access to your user, otherwise `docker-compose` will create it, but with write access only for root, and your behat tests will fail.

By default, latest versions of `akeneo`, `akeneo-behat`, `akeneo-fpm` and `akeneo-behat-fpm` are used. But you can also choose to use a specific tag. Currently, are available `php-5.6` and `php-7.0` (same as `latest`).

## Run and stop the containers

All `docker-compose` commands are to be ran from the folder containing the compose file.

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

## Configure Akeneo PIM 

First, make sure that Akeneo database settings are as the containers expect them:

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

Don't forget to configure MongoDB, if needed, by activating the `DoctrineMongoDBBundle` in `app/AppKernel.php`, and by adding the following to your parameters:

```yaml
# /host/path/to/you/pim/app/config/parameters.yml and parameters.yml.dist to avoid removal on "composer update"
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

Then you can initialize Akeneo with these commands:

```bash
$ docker-compose exec akeneo composer require --dev --no-update alcaeus/mongo-php-adapter
$ docker-compose exec akeneo php -d memory_limit=-1 /usr/local/bin/composer update
$ docker-compose exec akeneo pim-initialize

$ docker-compose exec akeneo-behat pim-initialize
```

As *xdebug* is deactivated by default on development images, you should activate it at the end of the installation if you want to debug.

If you want to activate it by default, you can turn the environment variable "PHP_XDEBUG_ENABLED" to "1"

Also, you can configure two things on Xdebug through environment variables on akeneo and akeneo-behat images. These environment variables are all optional. 
- PHP_XDEBUG_DEFAULT_ENABLE: 0 or 1 (by default 1)
- PHP_XDEBUG_REMOTE_HOST: your host IP address (by default it allows all IPs)
- PHP_XDEBUG_IDE_KEY: the IDE KEY you want (by default XDEBUG_IDE_KEY)

You should now be able to access Akeneo development environment from your host through `http://localhost:8080/` and behat environment through `http://localhost:8081/` (of course, you can change the host port in the compose file).

To access Akeneo in dev mode, through `http://localhost:8080/app_dev.php`, don't forget to comment the `if (isset($_SERVER['HTTP_CLIENT_IP'])` condition in `web/app_dev.php`.

## Run behat tests

The tests are to be run inside the containers. Start by configuring Behat:

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

You are now able to run behat tests with:

```bash
$ docker-compose exec akeneo-behat bin/behat features/path/to/scenario
```

## What if?

### I want to see my tests running

The docker image `selenium/standalone-firefox-debug` comes with a VNC server in it. You need a VNC client, and to connect to `localhost:5900`. You will then be able to see you browser and your tests running in it!

### I don't want to see my tests running

It is the default behavior, but in this case, you don't need to have a VNC server in your selenium container.

You can achieve that simply by replacing the image `selenium/standalone-firefox-debug` by `selenium/standalone-firefox`. The first is based on the second, simply adding the VNC server.

Don't forget to also remove the binding on port 5900, now useless as `selenium/standalone-firefox` does not expose it.
 
### I want to run my tests in Chrome instead of Firefox

Then all you need to do is to replace the image `selenium/standalone-firefox-debug` by `selenium/standalone-chrome-debug` (or `selenium/standalone-chrome` if you don't want to see the browser in action).

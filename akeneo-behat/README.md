# Akeneo behat on Docker

This is a Docker test environment for Akeneo PIM, intended to run behat scenarios.

This environment is based on [carcel/apache-php](https://hub.docker.com/r/carcel/apache-php/).

## How to use it?

### From GitHub

Clone the repository and go inside the created folder. Copy/paste the file `docker-compose.yml.dist` as `docker-compose.yml`, and replace `/path/to/your/pim` by the path to your project.

Replace `/home/you/.composer` by your own `.composer` folder, this will allow to use your own github tocken when installing vendors.

Then run:

```bash
$ docker-compose up --build -d
```

This will build the Dockerfile present in the repository, and run it with the other containers (MySQL and MongoDB)

### From Docker hub

The Dockerfile is available at [Docker hub](https://hub.docker.com/r/carcel/akeneo-behat/). In the `docker-compose.yml` file, you can replace `build: ./` by `image: carcel/akeneo:php-5.6` in the `akeneo` block.

This allow you to use the `docker-compose.yml` file in every PIM project you want, simply by placing it at the root of your project.

To use it, simply run:

```bash
$ docker-compose up -d
```

### Configure Akeneo PIM 

First, make sure that Akeneo database settings are as the container expect them:

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
    installer_data: PimInstallerBundle:minimal
```

Don't forget to configure MongoDB, if needed, by activating the `DoctrineMongoDBBundle` in `app/AppKernel.php`, and by adding the following to your parameters:

```yaml
# /host/path/to/you/pim/app/config/parameters.yml
parameters:
    ...
    pim_catalog_product_storage_driver: doctrine/mongodb-odm
    mongodb_server: 'mongodb://mongodb:27017'
    mongodb_database: akeneo_pim
```

Then you can initialize Akeneo with these commands (you will need to create a GitHub token for composer):

```bash
$ docker-compose exec akeneo composer update
$ docker-compose exec akeneo pim-initialize
```

You should now be able to access Akeneo from your host through `localhost:8080`.

## Run behat tests

The tests are to be run inside the container. Start by configuring Behat:

```yaml
# /host/path/to/your/pim/behat.yml
default:
    paths:
        features: features
    context:
        class:  Context\FeatureContext
        parameters:
            base_url: 'http://akeneo'
            timeout: 10000
            window_width: 1280
            window_height: 1024
    extensions:
        Behat\MinkExtension\Extension:
            default_session: symfony2
            show_cmd: chromium-browser %s
            selenium2:
                wd_host: 'http://selenium:4444/wd/hub'
            base_url: 'http://akeneo'
            files_path: 'features/Context/fixtures/'
        Behat\Symfony2Extension\Extension:
            kernel:
                env: behat
                debug: false
        SensioLabs\Behat\PageObjectExtension\Extension: ~
```

You are now able to run behat tests directly into the container by runing:

```bash
$ docker-compose exec akeneo bin/behat features/path/to/scenario
```

## What if?

### I want to see my tests running

The docker image `selenium/standalone-firefox-debug` comes with a VNC server in it. You need a VNC client, and to connect to `localhost:5900`.
You will then be able to see you browser and your tests running in it!

### I don't want to see my tests running

It is the default behavior, but in this case, you don't need to have a VNC server in your selenium container.

You can achieve that simply by replacing the image `selenium/standalone-firefox-debug` by `selenium/standalone-firefox`. The first is based on the second, simply adding the VNC server.

Don't forget to also remove the port 5900 binding, as `selenium/standalone-firefox` does not expose it.
 
### I want to run my tests in Chrome instead of Firefox

Then all you need is to replace the image `selenium/standalone-firefox-debug` by `selenium/standalone-chrome-debug` (or `selenium/standalone-chrome` if you don't want to see the browser in action).

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

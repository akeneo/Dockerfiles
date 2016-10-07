# Akeneo on Docker

This is a Docker development environment for Akeneo PIM.

This environment is based on [carcel/apache-php](https://hub.docker.com/r/carcel/apache-php/).

## How to use it?

### From GitHub

Clone the repository and go inside the created folder. Copy/paste the file `docker-compose.yml.dist` as `docker-compose.yml`, and replace `/path/to/your/pim` by the path to your project.

Then run:

```bash
$ docker-compose up --build -d
```

This will build the Dockerfile present in the repository, and run it with the other containers (MySQL and MongoDB)

### From Docker hub

The Dockerfile is available at [Docker hub](https://hub.docker.com/r/carcel/akeneo/). In the `docker-compose.yml` file, you can replace `build: ./` by `image: carcel/akeneo` in the `apache-php` block.

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
$ docker-compose exec apache-php composer update
$ docker-compose exec apache-php pim-initialize
```

You should now be able to access Akeneo from your host through `localhost:8080`.
To access it through `localhost:8080/app_dev.php`, don't forget to comment the `if (isset($_SERVER['HTTP_CLIENT_IP'])` condition in `web/app_dev.php`.

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

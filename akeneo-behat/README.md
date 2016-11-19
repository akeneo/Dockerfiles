# Akeneo behat on Docker

This is a Docker test environment for Akeneo PIM, intended to run behat scenarios.

This environment is based on [carcel/apache-php](https://hub.docker.com/r/carcel/apache-php/).

## How to use it?

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/carcel/akeneo-behat/) by running:

```bash
$ docker run --name akeneo-behat -p 8080:80 -d carcel/akeneo-behat:php-5.6
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t "akeneo-behat" .
```

Then you can run a container like this:

```bash
$ docker run --name akeneo-behat -p 8080:80 -d akeneo-behat
```

### Use this image with docker-compose

Instructions for docker-compose can be found [here](https://github.com/damien-carcel/Dockerfiles/blob/php-5.6/COMPOSE.md).

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

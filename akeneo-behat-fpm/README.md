# Akeneo behat and FPM on Docker

This is a Docker test environment for Akeneo PIM, intended to run behat scenarios based on [carcel/fpm](https://hub.docker.com/r/carcel/fpm).

It is configured to listen to the port 9001, and is intended to be used with [carcel/akeneo-behat-nginx](https://hub.docker.com/r/carcel/akeneo-behat-nginx).

## How to use it?

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/carcel/akeneo-behat-fpm/) by running:

```bash
$ docker run --name akeneo-behat-fpm -p 8080:80 -d carcel/akeneo-behat-fpm
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t "akeneo-behat-fpm" .
```

Then you can run a container like this:

```bash
$ docker run --name akeneo-behat-fpm -p 8080:80 -d akeneo-behat-fpm
```

### Use this image with docker-compose

Instructions for docker-compose can be found [here](https://github.com/damien-carcel/Dockerfiles/COMPOSE.md).

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

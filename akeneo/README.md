# Akeneo on Docker

This is a Docker development environment for Akeneo PIM.

This environment is based on [carcel/apache-php](https://hub.docker.com/r/carcel/apache-php/).

## How to use it?

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/carcel/akeneo/) by running:

```bash
$ docker run --name akeneo -p 8080:80 -d carcel/akeneo:php-5.6
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t "akeneo" .
```

Then you can run a container like this:

```bash
$ docker run --name akeneo -p 8080:80 -d akeneo
```

### Use this image with Docker Compose

The easiest way to use these images is [Docker Compose](https://docs.docker.com/compose/). You can found detailed explanations [here](https://github.com/damien-carcel/Dockerfiles/blob/master/COMPOSE.md).

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

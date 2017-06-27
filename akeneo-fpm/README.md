# Akeneo and FPM on Docker

This is a Docker development environment for Akeneo PIM with PHP FPM, based on [akeneo/fpm](https://hub.docker.com/r/akeneo/fpm).

It is configured to listen to the port 9001, and is intended to be used with [nginx](https://hub.docker.com/_/nginx).

## How to use it?

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/akeneo/akeneo-fpm/) by running:

```bash
$ docker run --name akeneo-fpm -p 8080:80 -d akeneo/akeneo-fpm
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t "akeneo-fpm" .
```

Then you can run a container like this:

```bash
$ docker run --name akeneo-fpm -p 8080:80 -d akeneo-fpm
```

### Use this image with Docker Compose

The easiest way to use these images is [Docker Compose](https://docs.docker.com/compose/). You can found detailed explanations [here](https://github.com/akeneo/Dockerfiles/blob/master/Docs/akeneo/compose.md).

## License

This repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

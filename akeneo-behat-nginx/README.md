# Akeneo behat and nginx on Docker

This is a Docker test environment for Akeneo PIM, intended to run behat scenarios with nginx. It is based on [carcel/nginx](https://hub.docker.com/r/carcel/nginx).

nginx is configured to listen to the port 9001. It is intended to be used with [carcel/akeneo-behat-fpm](https://hub.docker.com/r/carcel/akeneo-behat-fpm).

## How to use it?

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/carcel/akeneo-behat-nginx/) by running:

```bash
$ docker run -p 8080:80 -d -v /path/to/your/pim:/home/docker/pim --name nginx carcel/akeneo-behat-nginx
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t "nginx" .
```

Then you can run a container like this:

```bash
$ docker run --name nginx -d nginx
```

### Use this image with docker-compose

Instructions for docker-compose can be found [here](https://github.com/damien-carcel/Dockerfiles/blob/master/COMPOSE.md).

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

# nginx on Docker

This is a nginx environment, based on [nginx](https://hub.docker.com/_/nginx/), preconfigured to run with user "docker".

## How to use it?

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/carcel/nginx/) by running:

```bash
$ docker run -p 8080:80 -d --name nginx carcel/nginx
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

## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

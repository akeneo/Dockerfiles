# PHP FPM on Docker

This is a basic Docker environment for PHP FPM development, based on [carcel/php](https://hub.docker.com/r/carcel/php).

It is not intended to use directly as it stands, but rather to extend it and create custom development environments.

It comes with PHP 7.0 (provided by dotdeb.org repository), and some PHP extensions: fpm of course,
but also apcu, mcrypt, intl, mysql, curl, gd, mongo, soap, xml, zip, and xdebug (this last one comes deactivated,
run `phpenmod xdebug` to enable it).

The PHP FPM daemon is configured with "docker" as user and group, and listen to the socket "/run/php/php7.0-fpm.sock".

## How to use it?

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/carcel/apache-php/) by running:

```bash
$ docker run -p 8080:80 -d --name fpm carcel/fpm:7.0
```

Access the URL `localhost:8080` with your web browser to check that the container works.

### From GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t "fpm" .
```

Then you can run a container like this:

```bash
$ docker run --name fpm -d fpm
```


## License

This repository is under the MIT license. See the complete license in the `LICENSE` file.

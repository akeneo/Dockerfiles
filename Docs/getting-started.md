# Getting started

The content of this guide is not to replace the official Docker documentation, but only to allow beginners to quickly have a running `Docker` + `Docker Compose` installation.

I strongly encourage you to read the [official documentation anyway](https://docs.docker.com/), in order to better understand Docker.

## Installation

### Docker

You can find detailed installation instruction [here](https://docs.docker.com/engine/installation/). It covers the most common Linux distribution, but also Windows and MacOS X.

Most of Linux distribution comes with Docker in their official repositories, but they often propose very old versions. This is particularly true for Debian and Ubuntu, even in their most recent versions.

The official documentation proposes to use Docker own repositories and packages, and I recommend you to do so, as Docker is still a relatively young technology, evolving very quickly.

**Important:** On Linux, don't forget, once Docker installed, to add your user to the Docker group. This will allow you to run Docker commands without `sudo`. On most distribution, the following command (to run as `root` or with `sudo`) should work:

```bash
# gpasswd -a user docker
```

### Docker Compose

The installation process for Windows and MacOS X already provides `Docker Compose`. On Linux, you need to install it in a second step.

Most of the distribution do not provide `Compose` in their repositories (or propose very old versions, like for Docker).
The best way is to install the last version directly [from GitHub](https://github.com/docker/compose/releases), as proposed by the [official documentation](https://docs.docker.com/compose/install/).

## The compose file

The best way to understand a new tool is, in my opinion, an example. You can see below a very basic compose file.

It allows to run a Symfony application (but it would work with other PHP web application too) with Apache, PHP and MySQL.

There is several versions of the compose file format. The most recent it is, the most recent version of `Docker` and `Docker Compose` you need to run it.
I chose version 2.0 because it has a lot of improvements regarding the 1.0, and because other versions did not exists when I started this repository.
My examples could use more recent version in the future, and I encourage you to look at the new versions, as they could introduce new features that are usefull to you.

```yaml
version: '2'

networks:     # Here we define a network, in which everything that happen in the containers will be isolated.
  symfony: ~  # We only define the name of the network, no specific configuration.

services:     # Each service you define below will be a container. It allows you to define you container configuration in a clear, readable way
  apache:     # This is our Apache + PHP container (as `mod_php` package needs both `php` and `apache` package, everything is in one container)
    image: akeneo/apache-php:latest                 # We use the image `akeneo/apache` in its latest version to create the container
    depends_on:
      - mysql                                       # This container will depend on the MySQL on, meaning it won't start until MySQL container is
    environment:
      COMPOSER_HOME: /home/docker/.composer         # Ensure the composer home folder will be where we expect it for volume sharing
    ports:  
      - '8080:80'                                   # Here we map the ports: port 80 of the container will be redirected on port 8080 on your machine
    user: docker                                    # Every command we execute in the container will be as the `docker` user (id 1000 group 1000, defined during the build of the image `akeneo/apache`)
    volumes:
      - ./:/home/docker/application                 # We map the content of the current folder (usually your PHP application) with `/home/docker/application` (because `akeneo/apache` contains a vhost pointing to this location)
      - ~/.config/composer:/home/docker/.composer   # Same thing with you own composer folder, allowing you to use your own composer cache and GitHub token when running `composer update` for instance
    working_dir: /home/docker/application           # The default working directory, so if for instance you run `app/console cache:clear` with `docker-compose`, it will be in this folder
    networks:
      - symfony                                     # The Docker network we want our application to run within.

  mysql:
    image: mysql:5.7                                # Here we use the official MySQL 5.7 image: https://hub.docker.com/_/mysql/
    environment:                                    # We can provide some environment variables to the container when we start it
      - MYSQL_ROOT_PASSWORD=root                    # Here they are used to initialize MySQL with a root password and a default database
      - MYSQL_USER=symfony
      - MYSQL_PASSWORD=symfony
      - MYSQL_DATABASE=symfony
    networks:
      - symfony
```

You can notice than the mapping of the ports or of the volumes works the same way: first you provide the one of your own machine, then in second you provide the one of the Docker container.

By mapping the port 80 of the container `apache` to your port 8080, you can access the PHP application in your web browser at the URL `localhost:8080` (you can of course choose another port).

### Special note about composer

In the above example, the composer home folder inside the container is ensured to be `/home/docker/composer` and shared with your own host machine.
If you have not installed `composer` on your host machine, then you can choose whatever folder you want.
However, if you have and use `composer` on your host, then check first where this home folder is. You can find more information in [composer documentation](https://getcomposer.org/doc/03-cli.md#composer-home) about it.

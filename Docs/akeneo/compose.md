# Akeneo development and testing with docker-compose

**IMPORTANT - These images do not contain Akeneo.** 
They are intended to be used with an already existing (or new) Akeneo project on your host machine, that will be mount as a data volume.

Two compose file examples are provided, both providing two environments, one for development, the other for running behat and integration tests:

- [**The first compose file**](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/akeneo/docker-compose.yml.apache_dist) provides Apache + mod_php environments:
    - it uses [`carcel/akeneo-apache`](https://hub.docker.com/r/carcel/akeneo-apache/),
    - you can access the full documentation regarding this compose file [here](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/akeneo/mod_php.md).
    
- [**The second one**](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/akeneo/docker-compose.yml.fpm_dist) provides nginx + PHP-FPM:
    - it uses [`carcel/akeneo-fpm`](https://hub.docker.com/r/carcel/akeneo-fpm/) and  [`carcel/nginx`](https://hub.docker.com/r/carcel/nginx/),
    - you can access the full documentation regarding this compose file [here](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/akeneo/fpm.md).

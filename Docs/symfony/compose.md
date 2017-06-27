# Symfony development with docker-compose

**IMPORTANT - These images do not contain Symfony.**
They are intended to be used with an already existing (or new) Symfony project on your host machine, that will be mount as a data volume.

Two compose file examples are provided:

- [**The first compose file**](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/docker-compose.yml.apache_dist) provides Apache + mod_php environments:
    - it uses [`akeneo/apache-php`](https://hub.docker.com/r/akeneo/apache-php/),
    - you can access the full documentation regarding this compose file [here](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/mod_php.md).
    
- [**The second one**](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/docker-compose.yml.fpm_dist) provides nginx + PHP-FPM:
    - it uses [`akeneo/fpm`](https://hub.docker.com/r/akeneo/fpm/) and  [`nginx`](https://hub.docker.com/_/nginx/),
    - you can access the full documentation regarding this compose file [here](https://github.com/akeneo/Dockerfiles/blob/master/Docs/symfony/fpm.md).

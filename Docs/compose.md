# Akeneo development and testing with docker-compose

**IMPORTANT - These images do not contain Akeneo.** So the first thing to do is obtaining Akeneo itself.
You can clone it from GitHub or use an archive (downloaded from Akeneo website, or from Akeneo Partner Portal if you are an integrator and have access to it).

The simplest way to run those images is to use [Docker Compose](https://docs.docker.com/compose/).
Two compose file examples are provided, both providing two environments, one for development, the other for running behat and integration tests.

- [**The first compose file**](https://github.com/damien-carcel/Dockerfiles/blob/master/docker-compose.yml.apache_dist) provides Apache + mod_php environments:
    - it uses [`carcel/akeneo-apache`](https://hub.docker.com/r/carcel/akeneo-apache/),
    - you can access the full documentation regarding this compose file [here](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/mod_php.md).
    
- [**The second one**](https://github.com/damien-carcel/Dockerfiles/blob/master/docker-compose.yml.fpm_dist) provides nginx + PHP-FPM:
    - it uses [`carcel/akeneo-fpm`](https://hub.docker.com/r/carcel/akeneo-fpm/) and  [`carcel/nginx`](https://hub.docker.com/r/carcel/nginx/),
    - you can access the full documentation regarding this compose file [here](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/fpm.md).

Most of the documentation is the same for both compose files, only small details change.
**However, remember that, for the moment, only Apache + mod_php, with PHP 5.6, is officialy supported by Akeneo.**
Other flavor (FPM) and versions (7.x) are only provided for testing purposes and should be used at your own risks.

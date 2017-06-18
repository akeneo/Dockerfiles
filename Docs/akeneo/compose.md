# Akeneo development and testing with docker-compose

**IMPORTANT - These images do not contain Akeneo.** 
They are intended to be used with an already existing (or new) Akeneo project on your host machine, that will be mount as a data volume.

Two compose file examples are provided, both providing two environments, one for development, the other for running behat and integration tests:

- [**The first compose file**](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/akeneo/docker-compose.yml.apache_dist) provides Apache + mod_php environments:
    - It uses [`carcel/akeneo-apache:php-5.6`](https://hub.docker.com/r/carcel/akeneo-apache/),
      along with [`mysql:5.5`](https://hub.docker.com/_/mysql/), [`selenium/standalone-firefox-debug:2.53.1-beryllium`](https://hub.docker.com/r/selenium/standalone-firefox-debug/) for behat testing, and optionally [`mongodb:2.4`](https://hub.docker.com/_/mongo/).
    - You can access the full documentation regarding this compose file [here](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/akeneo/mod_php.md).
    - **This compose file is the recommended on to use with Akeneo 1.7 and previous versions.**
    
- [**The second one**](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/akeneo/docker-compose.yml.fpm_dist) provides nginx + PHP-FPM:
    - It uses [`carcel/akeneo-fpm:php-7.1`](https://hub.docker.com/r/carcel/akeneo-fpm/) and  [`nginx`](https://hub.docker.com/_/nginx/),
      along with [`mysql:5.7`](https://hub.docker.com/_/mysql/), [elasticsearch:5](https://hub.docker.com/_/elasticsearch/), and [`selenium/standalone-firefox-debug:2.53.1-beryllium`](https://hub.docker.com/r/selenium/standalone-firefox-debug/) for behat testing.
    - You can access the full documentation regarding this compose file [here](https://github.com/damien-carcel/Dockerfiles/blob/master/Docs/akeneo/fpm.md).
    - **This compose file is the recommended on to use with Akeneo versions next to 1.7.**

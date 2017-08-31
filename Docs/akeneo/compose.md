# Akeneo development and testing with docker-compose

**IMPORTANT - These images do not contain Akeneo.** 
They are intended to be used with an already existing (or new) Akeneo project on your host machine, that will be mounted as a data volume.

Two compose file examples are already included in `akeneo/pim-community-dev` and `akeneo/pim-enterprise-dev` starting with version 1.7.
Both provide two environments, one for development, the other for running tests (functional tests with behat and integration tests with PHP Unit):

- [**The first compose file**](https://github.com/akeneo/pim-community-dev/blob/1.7/docker-compose.yml.dist) provides Apache + mod_php (PHP 5.6):
    - It uses [`akeneo/apache:php-5.6`](https://hub.docker.com/r/akeneo/apache-php/), [`mysql:5.5`](https://hub.docker.com/_/mysql/),
      [`selenium/standalone-firefox-debug:2.53.1-beryllium`](https://hub.docker.com/r/selenium/standalone-firefox-debug/),
      and optionally [`mongodb:2.4`](https://hub.docker.com/_/mongo/).
    - You can access the full documentation regarding this compose file [here](https://github.com/akeneo/Dockerfiles/blob/master/Docs/akeneo/mod_php.md).
    - **This compose file is the recommended one to use with Akeneo 1.7 and previous versions.**
    
- [**The second one**](https://github.com/akeneo/pim-community-dev/blob/master/docker-compose.yml.dist) provides FPM (PHP 7.1) with Apache 2.4 (with FCGI enabled):
    - It uses [`akeneo/fpm:php-7.1`](https://hub.docker.com/r/akeneo/fpm/),  [`httpd:2.4`](https://hub.docker.com/_/httpd/), [`mysql:5.7`](https://hub.docker.com/_/mysql/),
      [docker.elastic.co/elasticsearch/elasticsearch:5.5.2](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html),
      and [`selenium/standalone-firefox-debug:2.53.1-beryllium`](https://hub.docker.com/r/selenium/standalone-firefox-debug/) for behat testing.
    - You can access the full documentation regarding this compose file [here](https://github.com/akeneo/Dockerfiles/blob/master/Docs/akeneo/fpm.md).
    - **This compose file is the recommended one to use with Akeneo versions next to 1.7.**

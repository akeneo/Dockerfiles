# Node on Docker

[![Build Status](https://travis-ci.org/akeneo/Dockerfiles.svg)](https://travis-ci.org/akeneo/Dockerfiles)

This Dockerfile is a basic environment for front-end development and testing.

It is based on [node slim images](https://hub.docker.com/_/node), and comes with Chromium and Puppeteer

**This image does not contain Akeneo PIM**.

## Supported tags and corresponding `Dockerfile` links

- `10`, `latest` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/node/10/Dockerfile): The environment comes with Debian 9 (Stretch) and NodeJS 10
- `8` [(Dockerfile)](https://github.com/akeneo/Dockerfiles/blob/master/node/8/Dockerfile): The environment comes with Debian 9 (Stretch) and NodeJS 8

## How to use it

### From Docker hub

You can directly pull this image from [Docker hub](https://hub.docker.com/r/akeneo/node/) by running:

```bash
$ docker run -d --name akeneo-node akeneo/node
```

### Build the image from GitHub

Clone the repository, go inside the created folder, and build the docker image:

```bash
$ docker build -t akeneo/node .
```

Full documentation is accessible [here](https://github.com/akeneo/Dockerfiles#how-to-use-these-images)

## License

This image is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/Dockerfiles/blob/master/LICENSE) file.

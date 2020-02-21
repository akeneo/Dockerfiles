# Testing the Akeneo Dockerfiles

## Introduction

Running the tests uses two main scripts:
- `.ci/build_images.sh` will build the images from the Dockerfiles,
- `.ci/run_tests.sh` will run all the tests.

Both scripts are used on Travis CI, but can also be run manually on your machine.

### Building the images

You need to first export two environment variables to define which images and which tag you'll be building:

- `IMAGES` will contains the list of images to build,
- `VERSION` corresponds to the PHP or Node version of the tag you want.

For example, the following will build all images for PHP 7.2:

```bash
$ export IMAGES="php fpm"
$ export VERSION="7.2"
```

Running the `build_images.sh` script will build the images only for the tag you exported, in the order you set in the `IMAGES` environment variable.

The script will run `docker inspect` on each image to ensure it was correctly built.
If an error occurred, a message will be displayed, and the script will return `1` (indicating Travis CI a failure and causing a red build).
If there was no errors, then the script will return `0` (green build on Travis CI), displaying a message saying image exists.

### Running the tests

The two environment variables are also needed for the `run_tests.sh` script.
This main script will test again that the image to test exists (directly exits with `1` if it does not, without performing any other tests) and run all the tests available for each image.

The tests are all located in the `tests` directory, at the root of the project. They are split by images, all the tests of the `akeneo/php` image being in `tests/php`, for instance.
Each image directory contains a `common` directory, plus one directory per tag. The `common` directory contains tests that are to be run against all the versions of the image.
The other contains tag specific tests: for example, tests placed in `tests/fpm/php-7.2` are to be run against `akeneo/fpm:php-7.2` only.

The tests are run thanks to a script `run_image_tests.sh` placed in each image tests directory. You never have to run those scripts yourself nor modify them. They are here only to be called by `.ci/run_tests.sh`.
They are used to parse the sub-directories of their image and run the tests they find, first the "common" ones, then the "tag specific" ones.

## Adding new tests

As the tests are automatically detected when running `.ci/run_tests.sh`, one need only to add a new bash script in the correct folder to add a new test.

However, some rules have to be followed:

- name your file to reflect the meaning of your test (look at the other tests for inspiration),
- start your test with a description,
- return `0` in case of success, `1` in case of failure.

A template is available [here](https://github.com/akeneo/Dockerfiles/blob/master/.ci/test_template.sh). Just copy it in the right folder and rename it.
For example, if the test is to be run against all versions of `akeneo/php` image, place it in `tests/php/common/`. If it is specific to the PHP 7.2 version of the image, then place it in `tests/php/php-7.2/`.

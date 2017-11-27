# Testing the Akeneo Dockerfiles

## Introduction

Running the tests rests on two main scripts:
- `.ci/build_images.sh` will build the images from the Dockerfiles,
- `.ci/run_tests.sh` will run all the tests.

Both scripts are used on TravisCI, but can also be run on your machine.

### Building the images

You need to first export a `TAG` environment variable, to define which version of PHP you will build.
For example, the following will build all images for PHP 7.0:

```bash
$ export TAG="7.0"
```

Running the `build_images.sh` script will build the images only for the tag you exported, in the correct order:
first `akeneo/php`, then `akeneo/fpm` and `akeneo/apache-php` as both are based on `akeneo/php`.

The script will run `docker inspect` on each image to ensure it was correctly built. If an error occurred, a message
will be displayed, and the script will return `1` (indicating TravisCI a failure and causing a red build). If there
was no errors, then the script will return `0` (green build on TravisCI), displaying a message saying image exists.

### Running the tests

The `TAG` variable is also needed for the `run_tests.sh` script. It will allow to know what version of PHP to test.
This main script will test again that the image to test exists (directly exits with `1` if it does not) and run all
the tests available for each image.

The tests are all located in the `tests` directory, at the root of the project. They are split by images, all the tests
of the `akeneo/php` image being in `tests/php` for instance. Each image directory contains a `common` directory, plus
one directory per tag. The `common` directory contains tests that are to be run against all the versions of the image.
The other contains tag specific tests: for example, tests placed in `tests/fpm/php-5.6` are to be run against
`akeneo/fpm:php-5.6` only.

The tests are run thanks to base scripts `run_image_tests.sh` placed in each image tests directory. You never
have to run those scripts yourself nor modify them. They are here only to be called by `.ci/run_tests.sh`. They are
used to parse the sub-directories of their image and run the tests they find, first the "common" ones, then the "tag
specific" ones.

## Adding new tests

As the tests are automatically detected when running `.ci/run_tests.sh`, one need only to add a new bash script in the
correct folder to add a new test.

However, some rules have to be respected:
- name your file to reflect the meaning of your test (look at the other tests for inspiration),
- the test have to start with a description,
- it must return `0` if it succeed, `1` if it does not.

A template is available [here](https://github.com/akeneo/Dockerfiles/blob/master/.ci/test_template.sh). Just copy it in
the right folder. For example, if the test is to be run against all versions of `akeneo/apache-php` image, place it in
`tests/apache-php/common/`. If it is specific to the PHP 7.0 version of the image, then place it in
`tests/apache-php/php-7.0/`.

## Adding a new image

### Declaring the new image

The existing images are listed directly in the two main scripts `.ci/build_images.sh` and `.ci/run_tests.sh` as follow:

```bash
images=("php" "fpm" "apache-php")
tagPrefix=("" "php-" "php-")
```

The tag prefix allows to declare the TAG environment variable with only the PHP version, not the full Docker image tag.
For example, tags of `akeneo/php` are just the PHP version used, when `akeneo/fpm` tags are prefixed: the image using
PHP 5.6 corresponds to the tag `akeneo/fpm:php-5.6`.

When adding a new image, you need to add, in both scripts, the name of the image and the corresponding prefix. Order is
important too, as it will decide in which order the images are build.

Let's take an example and say we add a new intermediate image: `akeneo/php-extended`. This image inherits from
`akeneo/php`, and is the new ancestor for `akeneo/fpm` and `akeneo/apache-php`. Its tag is the PHP version prefixed by
`ext-`. Then will have the following new declaration:

```bash
images=("php" "akeneo/php-extended" "fpm" "apache-php")
tagPrefix=("" "ext" "php-" "php-")
```

### Adding the test directories

You need to add a new sub-directory `php-extended` inside the `tests` directory. In it, create a new
`run_image_tests.sh` script which will find the tests. It will mostly be a copy/past from one of the other images.

Then add a `common` directory, plus one directory for each tag. If we follow our previous example, you should end with
the following directories:

- tests/php-extended/common/
- tests/php-extended/php-5.6/
- ...

Finally, add the tests for this new image. If for any reason a folder remains empty, just put a `.gitkeep` empty file
in it (to be removed once at least one test is added).

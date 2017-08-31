# Development on a Mac using docker-sync
Due performance issues while developing on a Mac with docker-compose it’s necessary to use docker-sync.

## Requirements
Install [docker-sync](http://docker-sync.io/):
```bash
gem install docker-sync
```

Install [unison](https://www.cis.upenn.edu/~bcpierce/unison/):
```bash
brew install unison
```

## Starting the machine
To start the machine just use the following command:
```bash
docker-sync-stack start
```
To see what this command really does, have a look at the offical docker-sync [wiki](https://github.com/EugenMayer/docker-sync/wiki/2.2-sync-stack-commands).
# docker-mydumper
Yfix dockerized mydumper tool from percona.

Current docker image needed because there is official one
and I like nothing from currently existing implementations, so creating my own one :)

## Docker hub

* https://hub.docker.com/r/yfix/mydumper
* docker pull yfix/mydumper

## Useful links

* https://launchpad.net/mydumper
* https://github.com/maxbube/mydumper
* https://github.com/tophatmonocle/docker-mydumper
* https://github.com/lcacciagioni/docker_mydumper

## Environmental variables

* `ORIGIN_DB_NAME`
* `ORIGIN_DB_HOST`
* `ORIGIN_DB_PORT`
* `ORIGIN_DB_PASS`
* `ORIGIN_DB_USER`
* `DEST_DB_NAME`
* `DEST_DB_HOST`
* `DEST_DB_PORT`
* `DEST_DB_PASS`
* `DEST_DB_USER`

## Usage mode

Try to have a folder writable by everyone in your pc since the image runs as `root` user.
```bash
$ sudo mkdir /tmp/dumpdir
$ sudo chmod 0777 /tmp/dumpdir
$ docker run --env-file=~/.env -v "/tmp/dumpdir:/dumpdir:rw"
```
The `env-file` is a simple txt file with the following format:
```
ORIGIN_DB_NAME=...
ORIGIN_DB_HOST=...
ORIGIN_DB_PORT=...
ORIGIN_DB_PASS=...
ORIGIN_DB_USER=...
DEST_DB_NAME=...
DEST_DB_HOST=...
DEST_DB_PORT=...
DEST_DB_PASS=...
DEST_DB_USER=...
```
using the previous `env-file` example you can setup all the variables that you need to execute the dump of you database.

> Replace the `...` with your information.

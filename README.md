# wtt_db

## PostgreSQL with Docker-Compose (recommended)

### INSTALL GIT
-------------
1. install git https://git-scm.com/downloads

### INSTALL DOCKER
-------------
1. install docker https://www.docker.com/get-started
2. install docker-compose (only on linux, on osx this installs with docker)

### CLONE DB REPO
-------------
1. Open terminal and run this
```shell
$ git clone https://github.com/waterthetrees/wtt_db.git
$ cd wtt_db
```

### BUILD AND START THE DOCKER
---------------
1. start service: 
```shell
$ docker-compose up --build
$ docker-compose up (If its already built)
```


## PostgreSQL locally Without Docker (Takes longer)

### INSTALL Postgres/PostGIS from download
choose postgres 12.5
https://www.postgresql.org/download/


### INSTALL Postgres with brew (recommended if you are not using docker)
```shell
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew -v
$ brew update
$ brew install postgres
$ psql --version
$ brew services start postgres
$ brew services stop postgres
```

## CREATE DATABASE Manually Without Docker and Import Data
Run this:

```shell
$ ./create_database.sh
```


## TILESET TOKEN
sk.eyJ1IjoiMTAwa3RyZWVzIiwiYSI6ImNrbGlzOWV5ZTJhaHIycG1sNmo3aXVpYXoifQ.rs3jiio_FAx-jDGfWmmmzA
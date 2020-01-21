# Docker Environment

## Requirements
* Docker
(https://docker.com/)

## Usage

execute command below.
```
docker-compose up
```
open URL below.

* badgr-ui (http://localhost:4200)
    (userid: badgruser@localhost.local password: badgruser)
* badgr-admin (http://localhost:8000/staff)
    (userid: badgradmin password: badgradmin)
* API reference (http://localhost:8000)


## Directory
```
docker
|- README.md (this file)
|- docker-compose.yml
|- Dockerfile.ubuntu18 (Dockerfile for Ubuntu18.0.4)
|- Dockerfile.centos7 (Dockerfile for CentOs7)
|--db
|  |--entry-point
|  |  |-- dump.sql (initial data)
|  |
|  |--data (this dir will be made by Mysql)
|
|--init
|  |- init.sh (this will be executed at first time)
|  |- settings_local.py.example (Django setting file)
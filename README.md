# Introduction

This is a project using docker and symfony3
IMPORTANT : This project requires docker & docker-compose to be installed

Technologies used
---
- PHP 7.0
- Symfony 3.2
- Nginx
- docker
- Mysql
- Composer
- Git

### Structure
~~~
├── app : php symfony code is here
├── docker-compose.yml
├── fpm
├── mysql
├── nginx
~~~

- `app` is the directory for symfony project.
- `nginx` config is pointing to `app/public`, which can be changed in `nginx/default.conf`.
- `mysql` is reading env variable from .env file and it runs docker-entrypoint.sql(`please add your sql queries on it`) as entrypoint for the container.
- `php` running php7 with needed extensions.

## Usage

To run the app:
~~~
docker-compose up --build
~~~

To run phpunit tests:
~~~
docker exec -ti devmfpm  sh -c "./vendor/bin/phpunit -c phpunit.xml.dist"
~~~


## Starting
~~~
http://localhost:8080/
~~~

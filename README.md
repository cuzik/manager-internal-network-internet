# Mini

![APP-Mini](https://img.shields.io/badge/MiNi-Udesc-blue.svg?style=flat-square)
![GitHub top language](https://img.shields.io/github/languages/top/cuzik/manager-internal-network-internet.svg?style=flat-square)

[![Heroku](https://heroku-badge.herokuapp.com/?app=mini-udesc&style=flat)](https://mini-udesc.herokuapp.com)
[![Build Status](https://img.shields.io/travis/cuzik/manager-internal-network-internet.svg?branch=master&style=flat-square)](https://travis-ci.org/cuzik/manager-internal-network-internet)
[![Coverage Status](https://img.shields.io/coveralls/github/cuzik/manager-internal-network-internet/badge.svg?style=flat-square)](https://coveralls.io/github/cuzik/manager-internal-network-internet)

Depois eu descrevo melhor o projeto aqui

## Data Base

[Schema](erd.pdf)

## Dev

### Install project depedences

- Postgress

- Ruby `2.6.2`

- Rails `5.2.2`

- graphviz

### instlal dependences gems

```sh
gem install bundler
```

```sh
bundle install
```

### Setup DB file config

```sh
cp config/database.sample.yml config/database.yml
```

### Create DB

```sh
rails db:create
```

### Cosntruct DB
```sh
rails db:migrate
```

### Populate DB
```sh
rails db:seed
```

### up application

```sh
rails s
```

## Docker

### Build project

```sh
docker-compose build
```

### Configure and DB struct

```sh
docker-compose run web rake db:create db:migrate
```

### Populate DB

```sh
docker-compose run web rake db:seed
```

### Run the application

```sh
docker-compose up
```

# Name here

Description Here

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

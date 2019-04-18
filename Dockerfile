FROM ruby:2.6.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs

RUN mkdir -p /app
WORKDIR /app

ADD ./Gemfile ./Gemfile.lock ./

RUN gem install bundler && bundle install

ADD . ./

RUN cp config/database.sample.yml config/database.yml

FROM ruby:2.3.1

# Pg
RUN apt-get update -qq && apt-get install \
    -y build-essential libpq-dev lsb-release

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
RUN apt-get update -qq && apt-get install -y postgresql-client-9.5 && apt-get install -y poppler-utils

# Node Npm Bower
RUN apt-get update -qq && apt-get install \
    -y nodejs-legacy npm

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# Bundle
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY vendor /app/vendor
RUN gem update bundler && bundle install --jobs 4

EXPOSE 3000

# Copy the rest of Rails source
COPY . /app

WORKDIR $APP_ROOT
FROM ruby:2.5.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /keiba_sns_app

WORKDIR /keiba_sns_app

COPY Gemfile /keiba_sns_app/Gemfile
COPY Gemfile.lock /keiba_sns_app/Gemfile.lock

RUN bundle update
RUN bundle install --without production

COPY . /keiba_sns_app

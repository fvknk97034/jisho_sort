FROM ruby:3.4.2

WORKDIR /app

RUN apt-get update -qq && apt-get install -y mecab mecab-ipadic-utf8 libmecab-dev

COPY . .

RUN bundle install

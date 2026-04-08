FROM ruby:3.4.2

WORKDIR /tmp

RUN apt-get update -qq && apt-get install -y mecab mecab-ipadic-utf8 libmecab-dev sudo
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
RUN cd mecab-ipadic-neologd && ./bin/install-mecab-ipadic-neologd -n -y

WORKDIR /app
COPY . .

RUN bundle install

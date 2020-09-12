# ./Dockerfile

FROM ruby:2.7

RUN apt-get update && \
  apt-get install -y \
    postgresql-client

RUN gem install bundler
WORKDIR /app
COPY ./Gemfile /app/Gemfile
COPY ./install-gems.sh /app/install-gems.sh
RUN bundle install
RUN ./install-gems.sh

COPY . /app
RUN chmod +x /app/test.sh

ENTRYPOINT ["ruby", "/app/demos/write_and_read.rb" ]


FROM quay.io/artsy/ruby:2.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

ENV APP_DIR=/app
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

COPY Gemfile $APP_DIR/
COPY Gemfile.lock $APP_DIR/
RUN bundle install -j 10 --without development test

COPY . $APP_DIR

EXPOSE 3000

CMD ./config/start.sh

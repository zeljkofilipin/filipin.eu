FROM ruby:2.7

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 4000

COPY . .

CMD ["bundle", "exec", "jekyll", "s", "--drafts"]
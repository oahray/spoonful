FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /spoonful
COPY Gemfile /spoonful/Gemfile
COPY Gemfile.lock /spoonful/Gemfile.lock
RUN bundle install
COPY . /spoonful


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]

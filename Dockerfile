FROM ruby:2.6.6 

Run mkdir /yala_notlob
WORKDIR /yala_notlob 
COPY . /yala_notlob

# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN         apt-get update && apt-get install -y redis-server
EXPOSE      6379

RUN apt-get update && apt-get install sqlite3

RUN gem install rails bundler
RUN bundle install
# RUN npm install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


# RUN rails db:migrate

CMD ["rails", "server", "-b", "0.0.0.0"]
# Run rails server

# CMD         ["/usr/bin/redis-server"]
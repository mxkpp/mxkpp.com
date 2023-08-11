FROM jekyll/jekyll:4.2.2

ADD ./Jekyll-source/Gemfile /app/install/Gemfile
ADD ./Jekyll-source/Gemfile.lock /app/install/Gemfile.lock
RUN bundle install --gemfile=/app/install/Gemfile
RUN apk --update add imagemagick

FROM jekyll/jekyll:latest

WORKDIR /srv/jekyll

COPY . .           

RUN bundle install || true
RUN yarn install || true

EXPOSE 4000

CMD ["jekyll", "serve", "--host", "0.0.0.0", "--livereload"]

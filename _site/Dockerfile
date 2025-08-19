FROM ruby:3.1-alpine

RUN apk add --no-cache \
    build-base nodejs npm git openssh-client ca-certificates \
  && update-ca-certificates \
  && npm install -g yarn

WORKDIR /srv/jekyll

# 1) Kopiere Gem- und JS-Definitionen (ohne yarn.lock)
COPY Gemfile Gemfile.lock package.json ./

# 2) Installiere Gems & JS-Pakete (erzeugt yarn.lock im Image)
RUN bundle install
RUN yarn install

# 3) Kopiere den Rest der Site
COPY . .

# 4) SCSS‑Pfad in _variables.scss korrigieren
RUN sed -i \
    -e 's@["'\'']\.\./node_modules/bootstrap/scss/@"/bootstrap/@g' \
    _sass/_variables.scss

CMD ["jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--incremental", "--force_polling"]




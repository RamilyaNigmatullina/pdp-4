#!/usr/bin/env sh

set -e

cp .env.test .env

bundle install --deployment --path=vendor/bundle --without=development:staging:production --jobs=4 --retry=3

bin/rails db:create db:schema:load

nvm use 10.10.0

mkdir -p ~/.yarn-cache
bin/yarn install --ignore-engines

set +e

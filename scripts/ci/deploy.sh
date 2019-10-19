#!/usr/bin/env sh

set -e

export RAILS_ENV=production

cp .env.example .env

nvm use 10.10.0

bin/yarn install --ignore-engines
bin/yarn build

git add -f public/assets/

git config --global user.email "semaphoreci@pdp4"
git config --global user.name "Semaphore CI"
git commit -m "Deploy to Heroku"

heroku maintenance:on
git push --force heroku $BRANCH_NAME:master
heroku run --exit-code -- bundle exec rails db:migrate
heroku restart
heroku maintenance:off

set +e

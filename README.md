# Ramilya's PDP-4

[![Build Status](https://{ORGANIZATION_NAME}.semaphoreci.com/badges/{PROJECT_NAME}.svg)](https://ramilya.semaphoreci.com/projects/pdp-4)

It's a simple site for companies.

## Scripts
* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Dependencies

* Ruby 2.6.3
* Rails 6.0.2.1
* PostgreSQL

## Quick Start

```bash
# clone repo
git clone git@github.com:RamilyaNigmatullina/pdp-4.git
cd pdp-4

# install overmind
brew install tmux
brew install overmind

# configure ENV variables in .env
vim .env

# run setup script
bin/setup

# Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.
bin/ci

# run server on 5000 port
bin/server
```

## Test users

  - User: "user@example.com / password" (Company: RN, slug: rn)

## Production
http://www.rn-companies.ml

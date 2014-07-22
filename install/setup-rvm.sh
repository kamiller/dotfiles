#!/bin/bash

echo "installing rvm"

curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

rvm requirements
rvm install 1.9.3
rvm use 1.9.3 --default
rvm rubygems current

gem install rails
gem install bundler

ssh git@github.com

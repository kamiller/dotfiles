#!/bin/bash

curl -L https://get.rvm.io | bash

rvm requirements
rvm install 1.9.3
rvm use 1.9.3 --default
rvm rubygems current

gem install rails
gem install bundler

sudo apt-get install libmysqlclient-dev
sudo apt-get install nodejs

sudo mkdir /var/rails

#mkdir /var/rails/app
#mkdir shared/log
#mkdir shared/pids

#!/bin/bash

curl -L https://get.rvm.io | bash

rvm requirements
rvm install 1.9.3
rvm use 1.9.3 --default
rvm rubygems current

gem install rails
gem install bundler

sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y install git-core libmysqlclient-dev nodejs nginx

sudo mkdir /var/rails

#mkdir /var/rails/app
#mkdir shared/log
#mkdir shared/pids

#!/bin/bash

#adduser ${appname}
#addgroup ${appname} sudo

# disable root login /etc/ssh/sshd_config

sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get update
sudo apt-get upgrade -y

curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

rvm requirements
rvm install 1.9.3
rvm use 1.9.3 --default
rvm rubygems current

gem install rails
gem install bundler

sudo apt-get -y install git-core libmysqlclient-dev nodejs nginx

sudo mkdir /var/rails

#mkdir /var/rails/app
#mkdir shared/log
#mkdir shared/pids


# add jenkins authorized_key and private key

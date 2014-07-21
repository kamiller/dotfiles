#!/bin/bash

 if [ -z "${1}" ]; then
     echo "#### ERROR: no app name..."
     exit 1
 fi

appname=$1

sudo adduser ${appname}
sudo addgroup ${appname} sudo

# disable root login /etc/ssh/sshd_config

sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get update
sudo apt-get upgrade -y

sudo su - ${appname}
cd ~

echo "installing rvm"

curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm

rvm requirements
rvm install 1.9.3
rvm use 1.9.3 --default
rvm rubygems current

gem install rails
gem install bundler

sudo apt-get -y install git-core libmysqlclient-dev nodejs nginx

sudo mkdir -p /var/rails/${appname}/shared/log
sudo mkdir -p /var/rails/${appname}/shared/pids

sudo chown -R ${appname}:${appname} /var/rails/${appname}

# add jenkins authorized_key and private key
sudo cp -R .ssh /home/${appname}
sudo chown -R ${appname}:${appname} /home/${appname}/.ssh
sudo chmod -R 700 /home/${appname}/.ssh

echo "disable root login /etc/ssh/sshd_config"
sudo sed 's/^\(PasswordAuthentication \)yes/\1no/' -i /etc/ssh/sshd_config
sudo sed 's/^\(PermitRootLogin \)yes/\1no/' -i /etc/ssh/sshd_config
sudo service ssh restart

#!/bin/bash

curl -L https://get.rvm.io | bash

rvm requirements
rvm install 1.9.3
rvm use 1.9.3 --default
rvm rubygems current

gem install rails

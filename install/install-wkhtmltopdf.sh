#/bin/bash

#ubuntu 12.04 x64bit


wget https://code.google.com/p/wkhtmltopdf/downloads/detail?name=wkhtmltopdf-0.9.9-static-amd64.tar.bz2&can=2&q=
tar xvjf wkhtmltopdf-0.9.9-static-amd64.tar.bz2 
sudo mv wkhtmltopdf-0.9.9-static-amd64 /usr/local/bin/wkhtmltopdf

#install dependencies
sudo apt-get install openssl build-essential xorg libssl-dev libxrender-dev -y


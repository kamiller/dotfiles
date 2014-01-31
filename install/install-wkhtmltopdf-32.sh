#!/bin/bash

#ubuntu 12.04 x64bit


wget https://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.9.9-static-i386.tar.bz2
tar xvjf wkhtmltopdf-0.9.9-static-i386.tar.bz2 
sudo mv wkhtmltopdf-i386 /usr/local/bin/wkhtmltopdf

#install dependencies
#sudo apt-get install openssl build-essential xorg libssl-dev libxrender-dev -y

sudo apt-get install libfontconfig1

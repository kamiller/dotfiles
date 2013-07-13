#!/bin/bash

sudo service tomcat7 stop
sudo rm -rf /var/lib/tomcat7/webapps/ROOT
sudo cp /home/jenkins/deploy/ROOT.war /var/lib/tomcat7/webapps/ROOT.war
sudo service tomcat7 start

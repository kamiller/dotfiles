#!/bin/bash

#sudo cp iptables.up.rules /etc/
#sudo cp iptables /etc/network/if-pre-up.d/

sudo iptables -F
sudo iptables-restore < iptables.up.rules

sudo /sbin/service iptables save
sudo iptables -L

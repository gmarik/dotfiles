#!/bin/sh

#
sudo ufw allow proto tcp from any to any port 80
sudo ufw allow proto tcp from any to any port 8081 # external apache proxy

#smb
sudo ufw allow proto tcp from 192.168.1.0/24 to any port 135 
sudo ufw allow proto udp from 192.168.1.0/24 to any port 137
sudo ufw allow proto udp from 192.168.1.0/24 to any port 138
sudo ufw allow proto tcp from 192.168.1.0/24 to any port 139
sudo ufw allow proto tcp from 192.168.1.0/24 to any port 445

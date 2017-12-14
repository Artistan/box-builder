#!/usr/bin/env bash


sudo apt-get --assume-yes install memcached
sudo apt-get --assume-yes install php-memcached

# make sure memcached will start
sudo systemctl enable memcached.service
sudo systemctl start memcached.service

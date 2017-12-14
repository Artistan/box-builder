#!/usr/bin/env bash

# enable xdebug mod
sudo phpenmod xdebug;
mkdir -p /home/vagrant/Code/xdebug
sudo nginx -s reload
sudo service php7.1-fpm restart;

cd /etc/php/7.1/fpm/conf.d/
sudo wget --no-cookies --no-check-certificate -O 20-xdebug.ini https://gist.githubusercontent.com/Artistan/fd844bcd5580be2817d1f2ef54de534d/raw/xdebug.ini

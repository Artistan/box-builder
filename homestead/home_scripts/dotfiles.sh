#!/usr/bin/env bash
HOME_DIR="${HOME_DIR:-/home/vagrant}";

# template files...
cd $HOME_DIR
sudo wget --no-cookies --no-check-certificate -O .zshrc https://gist.githubusercontent.com/Artistan/fd844bcd5580be2817d1f2ef54de534d/raw/.zshrc
sudo wget --no-cookies --no-check-certificate -O .my.cnf https://gist.githubusercontent.com/Artistan/fd844bcd5580be2817d1f2ef54de534d/raw/.my.cnf

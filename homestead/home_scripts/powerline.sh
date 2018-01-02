#!/usr/bin/env bash

# dependancies
sudo apt-get --assume-yes install zsh
sudo apt-get --assume-yes install jq

# Install powerlevel9k
git clone https://github.com/Artistan/powerlevel9k.git /home/vagrant/.oh-my-zsh/custom/themes/powerlevel9k
cd /home/vagrant/.oh-my-zsh/custom/themes/powerlevel9k; git checkout next;
printf "\nsource ~/.bash_aliases\n" | tee -a /home/vagrant/.zshrc
printf "\nsource ~/.profile\n" | tee -a /home/vagrant/.zshrc


# clone
cd /tmp/
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
sudo ./install.sh
# clean-up a bit
cd ..
sudo rm -rf fonts
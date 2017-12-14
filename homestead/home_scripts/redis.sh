#!/usr/bin/env bash

# enable redis by default

# https://stackoverflow.com/a/37331750/372215 --- allow for external use, the virtualbox can take care of "security" this is just for dev.
sudo sed -i 's/^protected-mode.*/protected-mode no/' /etc/redis/redis.conf
sudo sed -i 's/^bind/#bind/' /etc/redis/redis.conf

# make sure redis will start
sudo systemctl enable redis.service

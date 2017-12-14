#!/usr/bin/env bash

# add elasticsearch to the apt list
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -;
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list;
sudo apt-get update

# main packages needed.
sudo apt-get --assume-yes install default-jre
sudo apt-get --assume-yes install elasticsearch

# setup elasticsearch service and cluster.
sudo systemctl enable elasticsearch.service;
sudo chmod -R 777 /etc/elasticsearch;
sudo echo 'cluster.name: Homestead' >> /etc/elasticsearch/elasticsearch.yml;
sudo echo 'network.host: ["_local_","_site_"]' >> /etc/elasticsearch/elasticsearch.yml;
sudo echo 'path.repo: "/tmp/repositories"' >> /etc/elasticsearch/elasticsearch.yml;
sudo chmod 644 /etc/elasticsearch/*;
sudo chmod 755 /etc/elasticsearch;
sudo systemctl restart elasticsearch

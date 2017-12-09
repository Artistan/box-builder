#!/bin/bash

# copy the base image from bento
echo "$PWD"
cp "$UBUNTU_DIR/ubuntu-16.04-amd64.json" "./$1.json"

cat "./$1.json"
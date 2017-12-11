#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; cd $DIR;

# copy the base image from bento
if [[ -f "../$1.json" && -z "$FORCE" ]]
then
    echo "json exists for $1"
else
    cp -f "$UBUNTU_DIR/ubuntu-16.04-amd64.json" "../$1.json"
    if [[ -f "../$1.json" ]]
    then
        echo "json created for $1"
        ./sed.sh "$1"
    else
        echo "failed to created json $1"
        exit 1;
    fi
fi

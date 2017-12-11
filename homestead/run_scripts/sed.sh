#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; cd $DIR;
source confirm.sh

CONFIG=`./read.config.sh "$1"`

if [[ -z "$CONFIG" ]]
then
    echo "no config found for $1"
    echo "build will result in a base ubuntu box."
    confirm "Do you want to stop?" && rm "../$1.json" && ./finish.sh && exit 1;
fi

# replace the path to the bento scripts
sed -i '' "s|\"scripts/cleanup.sh\"|$CONFIG\"scripts/cleanup.sh\"|" "../$1.json"
sed -i '' "s|\"box_basename\": \"ubuntu-16.04\"|\"box_basename\": \"$1\"|" "../$1.json"
sed -i '' "s|\"template\": \"ubuntu-16.04-amd64\"|\"template\": \"$1\"|" "../$1.json"


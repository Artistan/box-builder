#!/bin/bash
# make sure we are in current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; cd $DIR;
# check if git is available.
if which git >/dev/null; then
    cd ../..
    if [ -d "./bento" ]
      then
        echo "git repo chef/bento exists"
      else
        git clone https://github.com/chef/bento.git
    fi
    cd $DIR;
else
    echo "git is needed to download the repos."
fi
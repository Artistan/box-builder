#!/bin/bash
# make sure we are in current directory to start from.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; cd "$DIR";
# homestead dir
cd ..
export ORIGINAL_DIR="$PWD"
# base project dir
cd ..
export BASEDIR="$PWD"
# move into bento so the script locations are accurate
rsync -a -v "./homestead" "./bento";
# bento checkout dir
cd bento
export BENTO_DIR="$PWD"
export UBUNTU_DIR="$PWD/ubuntu"
# move to the build dir
cd "./homestead"
# new relative locations
export CURRENT_DIR="$PWD"
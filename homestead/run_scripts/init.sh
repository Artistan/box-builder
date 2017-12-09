#!/bin/bash
# make sure we are in current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; cd "$DIR";
# move into bento so the script locations are accurate
mv "../../homestead" "../../bento/";
# new relative locations
BENTO_DIR=".."
UBUNTU_DIR="../ubuntu"
CURRENT_DIR="./"
ORIGINAL_DIR="../../homestead"
# move to the build dir
cd "../../bento/homestead"
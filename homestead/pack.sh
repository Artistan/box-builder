#!/bin/bash
# exit on any subscript errors...
set -e

# make sure we are in current directory
HOME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; cd "$HOME_DIR";

if [[ -z "$1" ]]
then
    echo "no box name provided"
    exit
else
    echo "building a $1 box"
fi

echo "init/update bento repo"
run_scripts/bento.sh
echo "init and sync into bento repo"
source run_scripts/confirm.sh
source run_scripts/init.sh

export pack_box="$1"

run_scripts/copy.json.sh "$pack_box"

run_scripts/packer.sh "$pack_box"

echo "sync back to homestead dir"
source run_scripts/finish.sh


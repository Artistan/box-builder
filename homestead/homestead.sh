#!/bin/bash
# make sure we are in current directory
HOME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; cd "$HOME_DIR";
source run_scripts/bento.sh
source run_scripts/init.sh
# copy the base image from bento
echo "$PWD"
cp "..//ubuntu-16.04-amd64.json" "./homestead.json"
# replace the path to the bento scripts
sed -i '' 's|\"scripts/cleanup.sh\",|\
test\
\"scripts/cleanup.sh\",|' "./homestead.json"

cat "./homestead.json"
mv "$CURRENT_DIR" "$ORIGINAL_DIR"
cd "$CURRENT_DIR"
exit
# add our scripts.
sed i/\"scripts/cleanup.sh\",/\"scripts/cleanup.sh\",/

Clone chef/bento into same top level folder as this repo.
Run ./bin/copy-to-bento.sh
Replace scripts/cleanup.sh with scripts/homestead.sh in file ubuntu/ubuntu-16.04-amd64.json
Follow normal Packer practice of building ubuntu/ubuntu-16.04-amd64.json





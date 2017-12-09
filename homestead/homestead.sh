#!/bin/bash
# make sure we are in current directory
HOME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; cd "$HOME_DIR";
run_scripts/bento.sh
source run_scripts/init.sh

run_scripts/copy.json.sh homestead.json
run_scripts/sed.sh homestead.json "\"home_scripts/homestead.sh\""

source run_scripts/finish.sh
#
## add our scripts.
#
#sed i/\"scripts/cleanup.sh\",/\"scripts/cleanup.sh\",/
#
#Clone chef/bento into same top level folder as this repo.
#Run ./bin/copy-to-bento.sh
#Replace scripts/cleanup.sh with scripts/homestead.sh in file ubuntu/ubuntu-16.04-amd64.json
#Follow normal Packer practice of building ubuntu/ubuntu-16.04-amd64.json
#
#
#


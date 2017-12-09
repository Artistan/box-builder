#!/bin/bash

# replace the path to the bento scripts
sed -i '' 's|\"scripts/cleanup.sh\"|$2,\"scripts/cleanup.sh\"|' "./$1.json"

#!/bin/bash

# dont want to overwrite
rsync -a -v --ignore-existing --exclude='.git/' "$CURRENT_DIR" "$BASEDIR";
cd "$CURRENT_DIR"
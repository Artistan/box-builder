#!/bin/bash

rsync -a -v --ignore-existing "$CURRENT_DIR" "$BASEDIR";
cd "$CURRENT_DIR"
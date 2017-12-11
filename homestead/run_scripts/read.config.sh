#!/bin/bash
RUN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; cd "$RUN_DIR";

file="../configs/$1"
lines=`cat $file`
for line in $lines; do
        printf "\"./home_scripts/$line\","
done
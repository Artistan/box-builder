#!/bin/bash

rm -rf "${BENTO_DIR}/builds/${pack_box}.virtualbox.box" > /dev/null
echo "<---<--- if virtualbox pops up, do not touch it --->--->"
packer build -only=virtualbox-iso "${pack_box}.json" >> "${BASEDIR}/build.txt"
vagrant box add --force "${pack_box}" "file://localhost${BASEDIR}/bento/builds/${pack_box}.virtualbox.box"
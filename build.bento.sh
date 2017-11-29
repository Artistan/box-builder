#!/bin/bash
cd "$(dirname "$0")"

BASEDIR=$PWD


if which vagrant >/dev/null; then
    if which VirtualBox >/dev/null; then
        if which packer >/dev/null; then
            if which git >/dev/null; then
                cd ${BASEDIR}
                if [ -d "${BASEDIR}/bento" ]
                  then
                    echo "git repo chef/bento exists"
                  else
                    git clone https://github.com/chef/bento.git
                fi
                cd ${BASEDIR}/bento/ubuntu/
                rm -rf "${BASEDIR}/bento/builds/ubuntu-16.04.virtualbox.box" > /dev/null
                echo "<---<--- if virtualbox pops up, do not touch it --->--->"
                packer build -only=virtualbox-iso ubuntu-16.04-amd64.json >> "${BASEDIR}/build.txt"
                vagrant box add --force custom-bento "file://localhost${BASEDIR}/bento/builds/ubuntu-16.04.virtualbox.box"
            else
                echo "git is needed to download the repos."
            fi
        else
            echo "packer is needed to make a new image."
        fi
    else
        echo "virtualbox is needed to make a new image."
    fi
else
    echo "vagrant is needed to make a new image."
fi

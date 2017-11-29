#!/bin/bash
cd "$(dirname "$0")"

BASEDIR=$PWD

if [ -f ~/.vagrant.d/boxes/custom-bento/0/virtualbox/Vagrantfile ]
  then
    echo "vagrant box custom-bento exists"
  else
    echo "building vagrant box custom-bento"
    ./build.bento.sh
fi

if which vagrant >/dev/null; then
	if which git >/dev/null; then
		cd ${BASEDIR}
		if [ -d "${BASEDIR}/settler" ]
		  then
		    echo "git repo laravel/settler exists"
		  else
		    git clone https://github.com/laravel/settler.git
		fi
        if [ -f "${BASEDIR}/$1/build.sh" ]
          then
            echo "now building the $1 box"
            cd "${BASEDIR}/$1"
            # use our new custom build
            sed -i '' 's|bento/ubuntu-16.04|custom-bento|' Vagrantfile
            rm -f virtualbox.box > /dev/null
            ./build.sh >> "${BASEDIR}/build.txt"
            vagrant box add --force $1 "file://localhost${BASEDIR}/$1/virtualbox.box"
          else
            echo "now building the homestead box"
            cd ${BASEDIR}/settler/virtualbox
            # use our new custom build
            sed -i '' 's|bento/ubuntu-16.04|custom-bento|' Vagrantfile
            rm -f virtualbox.box > /dev/null
            ./build.sh >> "${BASEDIR}/build.txt"
            vagrant box add --force custom-homestead "file://localhost${BASEDIR}/settler/virtualbox/virtualbox.box"
        fi
	else
	    echo "git is needed to download the repos."
	fi
else
    echo "vagrant is needed to make a new image."
fi
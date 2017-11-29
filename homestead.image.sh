#!/bin/bash
cd "$(dirname "$0")"

BASEDIR=$PWD

echo "** track the build? **"
echo "tail -f ${BASEDIR}/build.txt"
echo "** this is going to take awhile **"
if which packer >/dev/null; then
	if which git >/dev/null; then
		cd ${BASEDIR}
		if [ -d "${BASEDIR}/bento" ]
		  then
		    echo "git repo chef/bento exists"
		  else
		    git clone https://github.com/chef/bento.git
		fi
		if [ -d "${BASEDIR}/settler" ]
		  then
		    echo "git repo laravel/settler exists"
		  else
		    git clone https://github.com/laravel/settler.git
		fi
	    sed -i '' 's|bento/ubuntu-16.04|custom-bento|' "${BASEDIR}/settler/virtualbox/Vagrantfile"
		cd ${BASEDIR}/bento/ubuntu/
		echo "<---<--- if virtualbox pops up, do not touch it --->--->"
		packer build -only=virtualbox-iso ubuntu-16.04-amd64.json > "${BASEDIR}/build.txt"
		vagrant box add --force custom-bento "file://localhost${BASEDIR}/bento/builds/ubuntu-16.04.virtualbox.box"
		#if supplied a repo to build from, then use that one.
        if [ -f "${BASEDIR}/$1/build.sh" ]
          then
            echo "now building the $1 box"
            cd "${BASEDIR}/$1"
            ./build.sh
            vagrant box add --force $1 "file://localhost${BASEDIR}/$1/virtualbox.box"
          else
            echo "now building the homestead box"
            cd ${BASEDIR}/settler/virtualbox
            ./build.sh
            vagrant box add --force custom-homestead "file://localhost${BASEDIR}/settler/virtualbox/virtualbox.box"
        fi
	else
	    echo "git is needed to download the repos."
	fi
else
    echo "packer is needed to make a new image."
fi

#!/bin/bash
cd "$(dirname "$0")"

BASEDIR=$PWD

while getopts "h?:" opt; do
    case "$opt" in
    h|\?)
        echo '
# requires basic virtualization stuff...
brew install packer git
brew cask install vagrant
brew cask virtualbox-extension-pack
vagrant plugin install vagrant-bindfs
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-vbguest

# clone this repository
git clone https://github.com/Artistan/homestead-builder.git ~/homestead-builder
cd ~/homestead-builder

# run a build for a new image. (auto clones repos) Forces both boxes to build
./build.box.sh homestead

---------------------- OR ----------------------

# build a different named box, see homestead/configs/README.md
./build.box.sh redis
        '
        exit 0
        ;;
    esac
done

echo "** track the build? **"
echo "tail -f ${BASEDIR}/build.txt"
echo "** this is going to take awhile **"

if which vagrant >/dev/null; then
    if which VirtualBox >/dev/null; then
        if which packer >/dev/null; then
            if which git >/dev/null; then
                cd homestead
                ./pack.sh "$1"
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
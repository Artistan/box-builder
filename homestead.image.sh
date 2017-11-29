#!/bin/bash
cd "$(dirname "$0")"

BASEDIR=$PWD

while getopts "h?:" opt; do
    case "$opt" in
    h|\?)
        echo '
# requires git and packer
brew install packer git

# clone this repository
git clone https://github.com/Artistan/homestead-builder.git ~/homestead-builder
cd ~/homestead-builder

# run a build for a new image. (auto clones repos) Forces both boxes to build
./homestead.image.sh [optional custom-repo/folder]

# build settler / homestead box and use existing bento box if it is there
./build.settler.sh [optional custom-repo/folder]

# bento - just build your bento box again.
./build.bento.sh

# custom-repo/folder must contain the build.sh script
# example: artistan/virtualbox-elastic-plus
        '
        exit 0
        ;;
    esac
done

echo "** track the build? **"
echo "tail -f ${BASEDIR}/build.txt"
echo "** this is going to take awhile **"

./build.bento.sh
./build.settler.sh
#!/bin/sh

# Taken from https://github.com/jgm/pandoc/wiki/Installing-the-development-version-of-pandoc-%28Currently-1.12%29

# Set up my location
cd
PANDOC_SETUP_DIR=~/develop/pandoc
mkdir -p $PANDOC_SETUP_DIR
cd       $PANDOC_SETUP_DIR

echo Setting up pandoc code in `pwd` ...

# If you want to live dangerously, you can install the still-in-progress pandoc 1.11.2 from github.
# You'll need git the Haskell Platform.

sudo apt-get update
sudo apt-get install git
sudo apt-get install haskell-platform

# First, you'll need to install the new pandoc-types from the github repository:

git clone git://github.com/jgm/pandoc-types
cd pandoc-types
cabal update
cabal install --force
cd ..

# Now install the development version of citeproc-hs:

git clone git://github.com/jgm/citeproc-hs
# Note, this is a copy of the darcs repo; if you have darcs you can instead:
# darcs get --lazy http://gorgias.mine.nu/repos/citeproc-hs
cd citeproc-hs
cabal install --force
cd ..

# Finally, get the pandoc source:

git clone git://github.com/claremacrae/pandoc
cd pandoc
git submodule update --init
cabal install --enable-tests

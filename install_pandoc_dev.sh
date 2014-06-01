#!/bin/sh

# Taken from https://github.com/jgm/pandoc/wiki/Installing-the-development-version-of-pandoc

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

# Now install pandoc:

git clone git://github.com/jgm/pandoc
git submodule update --init
cd pandoc
cabal install --force --enable-tests
cabal test
cd ..

# And finally pandoc-citeproc:

git clone git://github.com/jgm/pandoc-citeproc
cd pandoc-citeproc
cabal install --enable-tests
cabal test

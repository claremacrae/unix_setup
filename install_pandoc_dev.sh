#!/bin/sh

# Taken from https://github.com/jgm/pandoc/wiki/Installing-the-development-version-of-pandoc

# Set up my location
cd
PANDOC_SETUP_DIR=~/develop/pandoc
mkdir -p $PANDOC_SETUP_DIR
cd       $PANDOC_SETUP_DIR

echo Setting up pandoc code in `pwd` ...

# If you want to live dangerously, you can install the still-in-progress pandoc from github.
# You'll need git and the Haskell Platform.

# First, you'll need to install the new pandoc-types from the github repository:

if [ ! -d pandoc-types ]; then
    git clone git://github.com/jgm/pandoc-types
fi
cd pandoc-types
cabal update
cabal install --force
cd ..

# Now install pandoc:

if [ ! -d pandoc ]; then
    git clone git://github.com/jgm/pandoc
fi
cd pandoc
git submodule update --init
cabal install --force --enable-tests
cabal test
cd ..

# And finally pandoc-citeproc:

if [ ! -d pandoc-citeproc ]; then
    git clone git://github.com/jgm/pandoc-citeproc
fi
cd pandoc-citeproc
cabal install --enable-tests
cabal test

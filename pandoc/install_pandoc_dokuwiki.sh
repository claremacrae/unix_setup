#!/bin/sh

# Taken from https://github.com/jgm/pandoc/wiki/Installing-the-development-version-of-pandoc
# and modified to pick up my development version, with dokuwiki output

# Set up my location
cd
PANDOC_SETUP_DIR=~/develop/pandoc_dokuwiki
mkdir -p $PANDOC_SETUP_DIR
cd       $PANDOC_SETUP_DIR

echo Setting up dokuwiki version of pandoc code in `pwd` ...

# If you want to live dangerously, you can install the still-in-progress pandoc from github.
# You'll need git and the Haskell Platform.

# First, you'll need to install the new pandoc-types from the github repository:

if [ ! -d pandoc-types ]; then
    git clone git://github.com/jgm/pandoc-types
fi
cd pandoc-types
git checkout bbae35cce0d81bae80e488eaf777537aa487e847
cabal update
cabal install --force
cd ..

# Now clone my copy of pandoc-templates:

if [ ! -d pandoc-templates ]; then
    git clone https://github.com/claremacrae/pandoc-templates.git
fi
cd pandoc-templates
git checkout dokuwiki
git remote add jgm git://github.com/jgm/pandoc-templates
git remote -v
cd ..

# Now install pandoc:

if [ ! -d pandoc ]; then
    git clone https://github.com/claremacrae/pandoc.git
fi
cd pandoc
git checkout dokuwiki
git remote add jgm git://github.com/jgm/pandoc
git remote -v
#git submodule update --init
cp ../pandoc-templates/* data/templates/
cabal install --force --enable-tests
cabal test
cd ..

# And finally pandoc-citeproc:

# This was the old version I was using - it is no longer available:
#git clone git://github.com/jgm/citeproc-hs
#cd citeproc-hs
#git checkout 2138963bfac7b5ee41762123395315830081cf2e
#cd ..


if [ ! -d pandoc-citeproc ]; then
    git clone git://github.com/jgm/pandoc-citeproc
fi
cd pandoc-citeproc
cabal install --enable-tests
cabal test

#!/bin/sh

# Taken from https://github.com/jgm/pandoc/wiki/Installing-the-development-version-of-pandoc

# Set up my location
cd
PANDOC_SETUP_DIR=~/develop/pandoc
mkdir -p $PANDOC_SETUP_DIR
cd       $PANDOC_SETUP_DIR

echo Setting up pandoc code in `pwd` ...

git clone git://github.com/jgm/pandoc-types
git clone git://github.com/jgm/citeproc-hs
git clone https://github.com/claremacrae/pandoc.git
git clone https://github.com/claremacrae/pandoc-templates.git

cd pandoc-types
git checkout bbae35cce0d81bae80e488eaf777537aa487e847
cd ..

cd citeproc-hs
git checkout 2138963bfac7b5ee41762123395315830081cf2e
cd ..

cd pandoc
git checkout dokuwiki
cd ..

cd pandoc-templates
git checkout dokuwiki
cd ..

cp pandoc-templates/* pandoc/data/templates/

cd pandoc-types
cabal install --force
cd ..

cd citeproc-hs
cabal install --force
cd ..

cd pandoc
cabal install

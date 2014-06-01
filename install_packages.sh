#!/bin/sh

# http://packages.ubuntu.com/quantal/build-essential
# dpkg-dev (>= 1.13.5)
#    Debian package development tools 
#
# g++ (>= 4:4.4.3)
#    GNU C++ compiler 
#
# gcc (>= 4:4.4.3)
#    GNU C compiler 
#
# libc6-dev
#    Embedded GNU C Library: Development Libraries and Header Files 
# or libc-dev
#    virtual package provided by libc6-dev 
#
# make 

sudo apt-get install build-essential checkinstall

# Version control tools (mercurial has already been installed)
sudo apt-get install cvs subversion git-core

# Make-alikes
sudo apt-get install autoconf automake cmake scons

# General editors
sudo apt-get install bluefish geany nedit scite

# Differencing tools
sudo apt-get install kdiff3-qt meld

# clang-specific requirements
sudo apt-get install libtool m4 texinfo texi2html
# tetex-bin


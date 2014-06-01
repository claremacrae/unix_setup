#!/bin/sh

# Taken from http://blog.llvm.org/2013/04/llvm-debianubuntu-nightly-packages.html

# Before running this, make sure that the correct lines have been added to
# /etc/apt/sources.list
#   ##--------------------------------------
#   ## Clare - additions
#   ## clang for Ubuntu Quantal 12.10
#   deb http://llvm.org/apt/quantal/ llvm-toolchain-quantal main
#   deb-src http://llvm.org/apt/quantal/ llvm-toolchain-quantal main

# Also do this:
#   wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -

apt-get install clang-3.3 clang-3.3-doc libclang-common-dev libclang-dev libclang1 libclang1-dbg libllvm-3.3-ocaml-d


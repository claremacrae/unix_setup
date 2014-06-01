#!/bin/sh

# Taken from http://clang.llvm.org/get_started.html

CLANG_DIR=/home/clare/tools/clang

mkdir -p $CLANG_DIR
cd       $CLANG_DIR

if [ ! -d llvm ] ; then

    # Checkout LLVM:

    svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm

    # Checkout Clang:

    cd llvm/tools
    svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
    cd ../..

    # Checkout extra Clang Tools: (optional)

    cd llvm/tools/clang/tools
    svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra
    cd ../../../..

    # Checkout Compiler-RT:

    cd llvm/projects
    svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt
    cd ../..
fi

# Build LLVM and Clang:

# This builds Debug+Asserts - which it says is 10 times slower than release builds
#llvm[0]: ***** Note: Debug build can be 10 times slower than an
#llvm[0]: ***** optimized build. Use make ENABLE_OPTIMIZED=1 to
#llvm[0]: ***** make an optimized build. Alternatively you can
#llvm[0]: ***** configure with --enable-optimized.

mkdir -p build
cd build
../llvm/configure
make
sudo make install

# cpp11-migrate doesn't get put into /usr/local/bin
# but it is built, and runs, in:
#   /home/clare/tools/clang/build/Debug+Asserts/bin/cpp11-migrate  --help


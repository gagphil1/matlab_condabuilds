#!/bin/bash

# Full paths break make check
#export CC=$(basename ${CC})
#export CXX=$(basename ${CXX})

#if [[ ${target_platform} == osx-64 ]]; then
#  XWIN_ARGS=--without-x
#else
#  XWIN_ARGS=--with-x
#fi

make

# Test and demo needs matlab or octave.
#make test
#make demo

cp mwrap $PREFIX/bin
cp mwrap.pdf $PREFIX/share
cp -r example $PREFIX/share
cp -r doc $PREFIX/share
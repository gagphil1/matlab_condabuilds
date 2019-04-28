#!/bin/bash

dst_path=$PREFIX/MATLAB/$PKG_NAME
mkdir -p $dst_path

if [ -f mex_compile.m ]; then
    $MATLAB_ROOT_DIR/bin/matlab -nodesktop  -sd . -r "mex_compile; quit"
fi

cp -R src $dst_path

if [ -f $PKG_NAME"_setup.m" ]; then
    cp $PKG_NAME"_setup.m" $PREFIX/MATLAB
fi
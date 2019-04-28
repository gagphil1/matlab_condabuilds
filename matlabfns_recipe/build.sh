#!/bin/bash

dst_path=$PREFIX/MATLAB/$PKG_NAME
mkdir -p $dst_path

cp -R MatlabFns $dst_path
cp matlabfns_setup.m $PREFIX/MATLAB
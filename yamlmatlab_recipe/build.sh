#!/bin/bash

dst_path=$PREFIX/MATLAB/$PKG_NAME
mkdir -p $dst_path
cp -R src/* $dst_path
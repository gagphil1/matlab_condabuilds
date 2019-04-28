#!/bin/bash

dst_path=$PREFIX/MATLAB/$PKG_NAME
mkdir -p $dst_path

cp -R channels $dst_path
cp -R classify $dst_path
cp -R detector $dst_path
cp -R doc $dst_path
cp -R external $dst_path
cp -R filters $dst_path
cp -R images $dst_path
cp -R matlab $dst_path
cp -R videos $dst_path

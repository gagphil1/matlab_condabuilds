#!/bin/bash
MATLAB_ROOT_DIR=/Applications/MATLAB_R2018b.app
export MATLAB_ROOT_DIR

conda build $1 $2 $3 $4 $5 \
 --no-anaconda-upload \
 -c defaults

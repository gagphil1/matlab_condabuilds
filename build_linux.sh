#!/bin/bash
MATLAB_ROOT_DIR=/usr/local/MATLAB/R2018b
export MATLAB_ROOT_DIR

conda build $1 $2 $3 $4 $5 \
     --no-anaconda-upload \
     -c defaults -c gagphil1

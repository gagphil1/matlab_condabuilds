#!/bin/bash

$MATLAB_ROOT_DIR/bin/matlab -nodesktop  -sd . -r "mex_compile; quit"

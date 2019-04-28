#!/bin/bash
MATLAB_ROOT_DIR=/Applications/MATLAB_R2018b.app
export MATLAB_ROOT_DIR

CONDA_DEPOT_PATH=`pwd`/../depot
echo $CONDA_DEPOT_PATH
conda index $CONDA_DEPOT_PATH

if [ $1 != "" ]
then
  conda build $1 $2 $3 $4 $5 \
     --no-anaconda-upload \
     --output-folder $CONDA_DEPOT_PATH \
     -c defaults -c $CONDA_DEPOT_PATH
else
  conda build mexopencv_recipe \
      --no-anaconda-upload \
      --output-folder $CONDA_DEPOT_PATH -c defaults

  conda build matgeom_recipe \
     --no-anaconda-upload \
     --output-folder $CONDA_DEPOT_PATH -c defaults

  conda build matlabfns_recipe \
     --no-anaconda-upload \
     --output-folder $CONDA_DEPOT_PATH -c defaults

  conda build pdollar_recipe \
     --no-anaconda-upload \
     --output-folder $CONDA_DEPOT_PATH -c defaults

  conda build vlfeat_recipe \
     --no-anaconda-upload \
     --output-folder $CONDA_DEPOT_PATH -c defaults
fi
matlab_condabuilds
==================

This is my solution for managing external Matlab (or Octave) libraries I want to try. It is based on conda packages.

Install
-------

1) Install environment

       conda create -n science_env conda m2-base
       conda activate science_env
       conda config --prepend channels -c gagphil1
       conda install matlab_support
       conda install mexopencv matlabfns vlfeat jsonlab matgeom pdollar yamlmatlab

2) Prepare Matlab
    
Put the science_env directory in matlab path (%CONDA_PREFIX%\MATLAB or conda info --base). 

Then to update paths, type in Matlab: 
    
    env_setup

You can also put it in your startup.m file.

Notes
=====

For octave 4: Need mingw 7.4: https://osdn.net/projects/mingw/releases/

Inspiration from major Conda package suites:
--------------------------------------------

* https://conda-forge.readthedocs.io/en/latest/
* https://bioconda.github.io/guidelines.html

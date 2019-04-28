PGPACK-BUILD
============

Inspiration from major Conda package suites:
--------------------------------------------

https://conda-forge.readthedocs.io/en/latest/
https://bioconda.github.io/guidelines.html

Runtime
-------

    conda index _path_to_pgpack/conda
    conda create -n science_env conda m2-base
    conda activate science_env
    conda config --prepend channels file:///_path_to_pgpack/conda
    conda install matlab_support
    conda install mexopencv matlabfns vlfeat jsonlab matgeom pdollar yamlmatlab



Put the science_env in matlab path (%CONDA_PREFIX%\MATLAB or conda info --base). Then to update paths, type in  Matlab:
    env_setup_env



OpenCV build package
====================

This is a recipe to build opencv and a binding for Matlab (or Octave).

This package revision is for OpenCV 3.4.1

Requirements
------------

You need anaconda installed and in the path.

Build OpenCV
------------

You only need to run build_macos, build_win64 or build_linux.



Notes
=====

For octave 4: Need mingw 7.4: https://osdn.net/projects/mingw/releases/


TODO
====
%addpath(fullfile(genextdir, 'libsvm', 'matlab'));
%addpath(fullfile(extdir, 'mksqlite'));
%addpath(fullfile(extdir, 'matconvnet'));
%run(fullfile(genextdir, 'vlfeat', 'toolbox', 'vl_setup'));

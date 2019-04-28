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

Notes
=====

For octave 4: Need mingw 7.4: https://osdn.net/projects/mingw/releases/

function matgeom_setup

basedir = fileparts(mfilename('fullpath'));
libpath = fullfile(basedir, 'matgeom', 'matGeom');

addpath(libpath);

addpath(fullfile(libpath, 'geom2d'));
addpath(fullfile(libpath, 'polygons2d'));
addpath(fullfile(libpath, 'graphs'));
addpath(fullfile(libpath, 'polynomialCurves2d'));
addpath(fullfile(libpath, 'geom3d'));
addpath(fullfile(libpath, 'meshes3d'));
addpath(fullfile(libpath, 'utils'));

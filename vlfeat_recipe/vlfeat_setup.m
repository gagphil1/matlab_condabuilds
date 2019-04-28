function vlfeat_setup

basedir = fileparts(mfilename('fullpath'));
libpath = fullfile(basedir, 'vlfeat', 'toolbox');
setuppath = fullfile(libpath, 'vl_setup.m');
run(setuppath);

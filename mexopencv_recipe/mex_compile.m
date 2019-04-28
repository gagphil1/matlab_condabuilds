%MEX_BUILD compile opencv bindings for Matlab or octave.

base_path = pwd;
opencv_path = fullfile(getenv('CONDA_PREFIX'), 'Library');
dst_path = fullfile(getenv('PREFIX'), 'MATLAB', 'mexopencv');
mkdir(dst_path);
copyfile('Contents.m', dst_path);
copyfile('samples', fullfile(dst_path, 'samples'));
copyfile('+mexopencv', fullfile(dst_path, '+mexopencv'));
copyfile('test', fullfile(dst_path, 'test'));

addpath(fullfile(base_path, '.'));
addpath(fullfile(base_path, 'opencv_contrib'));
mexopencv.make('opencv_path', opencv_path, 'opencv_contrib',true);
copyfile('+cv', fullfile(dst_path, '+cv'));

copyfile(fullfile('opencv_contrib', '+cv'), fullfile(dst_path, '+cv'));
copyfile(fullfile('opencv_contrib', 'samples'), fullfile(dst_path, 'samples'));

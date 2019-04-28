%MEX_BUILD compile opencv bindings for Matlab or octave.

% Example:
%
% base_path = pwd;
% dst_path = fullfile(getenv('PREFIX'), 'MATLAB', 'mexopencv');
% mkdir(dst_path);
% copyfile('Contents.m', dst_path);
% copyfile('samples', fullfile(dst_path, 'samples'));
% copyfile('+mexopencv', fullfile(dst_path, '+mexopencv'));
% copyfile('test', fullfile(dst_path, 'test'));

% addpath(fullfile(base_path, '.'));
% addpath(fullfile(base_path, 'opencv_contrib'));
% mexopencv.make('opencv_path', opencv_path, 'opencv_contrib',true);
% copyfile('+cv', fullfile(dst_path, '+cv'));

base_path = pwd;
lib_path = fullfile(base_path, 'src');
delete(fullfile(lib_path, '*.mex*'));
cd(fullfile(lib_path, 'MEX'));
delete('*.mex*');
compilePyrTools
copyfile('*.mex*', lib_path);



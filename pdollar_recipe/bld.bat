@echo OFF

set dst_path=%PREFI%\MATLAB\%PKG_NAME%
mkdir -p %dst_path%

del channels/private/*.mex*
del classify/private/*.mex*
del detector/private/*.mex*
del images/private/*.mex*
del matlab/private/*.mex*
del videos/private/*.mex*

cd external
%MATLAB_ROOT_DIR%\bin\matlab -nodesktop -wait -sd . -r "toolboxCompile; quit"
if errorlevel 1 exit /b 1
cd ..

copy channels %dst_path%
copy classify %dst_path%
copy detector %dst_path%
copy doc %dst_path%
copy external %dst_path%
copy filters %dst_path%
copy images %dst_path%
copy matlab %dst_path%
copy videos %dst_path%

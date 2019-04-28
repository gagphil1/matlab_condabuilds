@echo OFF
setlocal EnableDelayedExpansion

del opencv_contrib\src\+cv\private\RetinaFastToneMapping_.cpp
del opencv_contrib\src\+cv\private\Retina_.cpp
del opencv_contrib\src\+cv\private\TransientAreasSegmentationModule_.cpp

set dest=%PREFIX%

%MATLAB_ROOT_DIR%\bin\matlab -nodesktop -wait -sd . -r "mex_compile; quit"
if errorlevel 1 exit /b 1

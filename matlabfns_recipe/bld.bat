@echo OFF

set dst_path=%PREFIX%\MATLAB\%PKG_NAME%
mkdir %dst_path%

copy matlabfns_setup.m %PREFIX%\MATLAB
xcopy /E MatlabFns %dst_path%

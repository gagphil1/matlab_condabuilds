@echo OFF

set dst_path=%PREFIX%\MATLAB\%PKG_NAME%
mkdir %dst_path%

if exist mex_compile.m (
    %MATLAB_ROOT_DIR%\bin\matlab -nodesktop -wait -sd . -r "mex_compile; quit"
    if errorlevel 1 exit /b 1
)

xcopy /E src %dst_path%

if exist %PKG_NAME%_setup.m (
    copy %PKG_NAME%_setup.m %PREFIX%\MATLAB
)
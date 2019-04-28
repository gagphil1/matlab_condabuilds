@echo off

set MATLAB_ROOT_DIR="C:\Program Files\MATLAB\R2018b"

set CONDA_DEST_DEPOT_PATH=%cd%\..\conda
call conda index %CONDA_DEST_DEPOT_PATH%
if errorlevel 1 exit /b 1

if "%1" neq "" (
    call conda build %1 %2 %3 %4 %5 ^
        --no-anaconda-upload ^
        --output-folder %CONDA_DEST_DEPOT_PATH% ^
        -c defaults
    if errorlevel 1 exit /b 1
) else (
    call conda build mexopencv_recipe ^
        --no-anaconda-upload ^
        --output-folder %CONDA_DEST_DEPOT_PATH% ^
        -c defaults
    if errorlevel 1 exit /b 1

    call conda build matgeom_recipe ^
        --no-anaconda-upload ^
        --output-folder %CONDA_DEST_DEPOT_PATH% ^
        -c defaults
    if errorlevel 1 exit /b 1

    call conda build matlabfns_recipe ^
        --no-anaconda-upload ^
        --output-folder %CONDA_DEST_DEPOT_PATH% ^
        -c defaults
    if errorlevel 1 exit /b 1

    call conda build pdollar_recipe ^
        --no-anaconda-upload ^
        --output-folder %CONDA_DEST_DEPOT_PATH% ^
        -c defaults
    if errorlevel 1 exit /b 1

    call conda build vlfeat_recipe ^
        --no-anaconda-upload ^
        --output-folder %CONDA_DEST_DEPOT_PATH% ^
        -c defaults
    if errorlevel 1 exit /b 1
)
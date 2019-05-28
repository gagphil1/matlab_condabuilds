@echo on

set MATLAB_ROOT_DIR="C:\Program Files\MATLAB\R2019a"

call conda build %1 %2 %3 %4 %5 ^
	--no-anaconda-upload ^
	-c defaults -c gagphil1
if errorlevel 1 exit /b 1

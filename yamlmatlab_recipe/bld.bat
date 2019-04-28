@echo OFF

set dst_path=%PREFIX%\MATLAB\%PKG_NAME%
mkdir %dst_path%
robocopy src %dst_path% /e
if errorlevel 1 exit /b 0
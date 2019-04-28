@echo OFF

set dst_path=%PREFIX%\MATLAB\%PKG_NAME%
mkdir %dst_path%
xcopy /E src %dst_path%
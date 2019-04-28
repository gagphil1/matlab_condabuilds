@echo OFF

set dst_path=%PREFI%\MATLAB\%PKG_NAME%
mkdir %dst_path%
copy * %dst_path%

@echo OFF

set dst_path=%PREFIX%\MATLAB
mkdir %dst_path%
mkdir %dst_path%\private
copy env_setup.m %dst_path%
copy scripts\env_config.json %dst_path%\env_config.ref.json
copy jsonlab\*.* %dst_path%\private

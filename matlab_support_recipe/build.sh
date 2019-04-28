#!/bin/bash

dst_path=$PREFIX/MATLAB
mkdir -p $dst_path
mkdir -p $dst_path/private

cp env_setup.m $dst_path
cp scripts/env_config.json $dst_path/env_config.ref.json
cp jsonlab/*.* $dst_path/private

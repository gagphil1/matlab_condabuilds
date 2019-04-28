#!/bin/bash

mkdir build
cd build
cmake .. -DUSE_AVX_INSTRUCTIONS=1
cmake --build .

make install

cd ..
python setup.py install

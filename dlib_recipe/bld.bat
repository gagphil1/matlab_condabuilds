@echo OFF

mkdir build
cd build

rem cmake .. -G "Visual Studio 14 2015 Win64" -T host=x64 -DUSE_AVX_INSTRUCTIONS=1
cmake ..  -T host=x64 -DUSE_AVX_INSTRUCTIONS=1

cmake --build .

cd ..
python setup.py install

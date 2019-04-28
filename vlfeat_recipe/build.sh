#!/bin/bash

if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  if [ $ARCH -eq 64 ]; then
    VL_ARCH="glnxa64"
  else
    VL_ARCH="glnx86"
  fi
  DYNAMIC_EXT="so"
fi
if [ "$(uname -s)" == "Darwin" ]; then
  VL_ARCH="maci64"
  DYNAMIC_EXT="dylib"
fi

export CFLAGS="-I$INCLUDE_PATH -DVL_DISABLE_SSE2=1 -DVL_DISABLE_AVX=1 -DVL_DISABLE_OPENMP=1 -DVL_DISABLE_THREADS=1"
export LDFLAGS="-L$LIBRARY_PATH"

# Turn off all optimisations. Use vlfeat_avx for a fast version
make NO_TESTS=yes ARCH=${VL_ARCH} DISABLE_SSE2=yes DISABLE_AVX=yes DISABLE_THREADS=yes DISABLE_OPENMP=yes -j${CPU_COUNT}

# On OSX the resolution of the libvl.dylib doesn't seem to
# work properly for the executables - but they are properly
# relatively linked using @loader_path, therefore, copy
# the dylib into bin so they work properly.
if [ "$(uname -s)" == "Darwin" ]; then
  mkdir -p $PREFIX/bin/
  cp bin/${VL_ARCH}/libvl.${DYNAMIC_EXT} $PREFIX/bin/
fi

mkdir -p $PREFIX/bin
cp bin/${VL_ARCH}/sift $PREFIX/bin/
cp bin/${VL_ARCH}/mser $PREFIX/bin/
cp bin/${VL_ARCH}/aib $PREFIX/bin/

mkdir -p $LIBRARY_PATH
cp bin/${VL_ARCH}/libvl.${DYNAMIC_EXT} $LIBRARY_PATH/

mkdir -p $INCLUDE_PATH/vl
cp vl/*.h $INCLUDE_PATH/vl

#!/bin/bash

set -e
set -x

export PARQUET_BUILD_TOOLCHAIN=$PREFIX

mkdir build-dir
cd build-dir

cmake \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
    -DPARQUET_BOOST_USE_SHARED=off \
    -DPARQUET_BUILD_BENCHMARKS=off \
    -DPARQUET_BUILD_EXECUTABLES=on \
    -DPARQUET_BUILD_TESTS=off \
    ..

make -j${CPU_COUNT}
make install

mkdir -p $PREFIX/bin
for exe in parquet-dump-schema parquet_reader parquet-scan; do
    cp release/$exe $PREFIX/bin
done

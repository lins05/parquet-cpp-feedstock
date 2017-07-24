set PARQUET_BUILD_TOOLCHAIN=%LIBRARY_PREFIX%
set PARQUET_ARROW_VERSION=e9f76e125b836d0fdc0a533e2fee3fca8bf4c1a1

REM Set short build path to not overcome max obj files path length of 150 characters on Windows
mkdir C:\bld\build
pushd C:\bld\build

cmake -G "%CMAKE_GENERATOR%" -DCMAKE_BUILD_TYPE=Release ^
                             -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
                             -DPARQUET_BOOST_USE_SHARED=OFF ^
                             -DPARQUET_BUILD_TESTS=OFF ^
                             "%SRC_DIR%"

cmake --build . --target install --config Release

popd

#!/bin/bash
cmake \
    -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=$ABI  \
    -DANDROID_NATIVE_API_LEVEL=$ANDROID_PLATFORM \
    -GNinja \
    -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
    -DBUILD_TESTS=FALSE -DBUILD_PERF_TESTS=FALSE \
    -DBUILD_ANDROID_EXAMPLES=FALSE \
../opencv

ninja
ninja install

rm CMakeCache.txt
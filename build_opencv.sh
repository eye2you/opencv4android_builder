#!/bin/bash
rm CMakeCache.txt
cmake \
    -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=$ABI  \
    -DANDROID_NATIVE_API_LEVEL=$ANDROID_PLATFORM \
    -GNinja \
    -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DBUILD_TESTS=FALSE -DBUILD_PERF_TESTS=FALSE \
    -DBUILD_ANDROID_EXAMPLES=FALSE \
    -DCMAKE_CONFIGURATION_TYPES:STRING=Release \
    -DBUILD_opencv_highgui:BOOL=OFF \
    -DBUILD_opencv_js_bindings_generator:BOOL=OFF \
    -DBUILD_opencv_objc_bindings_generator:BOOL=OFF \
    -DINSTALL_CREATE_DISTRIB=ON \
    -DBUILD_DOCS:BOOL=OFF -DBUILD_EXAMPLES:BOOL=ON -DWITH_IPP=OFF -DWITH_MSMF=OFF \
../opencv

ninja
ninja install
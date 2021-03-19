#!/bin/bash
ABI=arm64-v8a ./build_opencv.sh
ABI=x86 ./build_opencv.sh
ABI=x86_64 ./build_opencv.sh
ABI=armeabi-v7a ./build_opencv.sh

cp -r install /data/
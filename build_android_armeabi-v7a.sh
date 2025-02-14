#!/bin/bash

aim_dir=./build-armeabi-v7a

if [[ -d $aim_dir ]];then
    rm -rf $aim_dir
fi

mkdir $aim_dir && cd $aim_dir
export ANDROID_NDK=/data/home/work_home/tools/android-ndk-r15c 
cmake ../ -G "Unix Makefiles" -DNE10_ANDROID_TARGET_ARCH=armv7 -DANDROID_NATIVE_API_LEVEL="android-23" \
       -DANDROID_ABI="armeabi-v7a" \
       -DANDROID_STL=c++_static  \
       -DCMAKE_BUILD_TYPE=RelWithDebInfo \
       -DCMAKE_TOOLCHAIN_FILE=../android/android_config.cmake
       #-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake
make

#!/bin/bash

OPENCV_VERSION=3.3.0
OPENCV_DIR="opencv-$OPENCV_VERSION"
OPENCV_INSTALL_DIR="/usr/local"

# install dependencies

`sudo apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev` 
`sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev`


if [ ! -d "./$OPENCV_DIR" ];then
    `wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.tar.gz && tar -xzf $OPENCV_VERSION.tar.gz`
fi


`cd $OPENCV_DIR && mkdir release && cd release`
`cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=$OPENCV_INSTALL_DIR -D BUILD_TESTS=OFF -D WITH_CUDA=ON -D CUDA_NVCC_FLAGS=--Wno-deprecated-gpu-targets ..`

`make -j4`
`sudo make install`




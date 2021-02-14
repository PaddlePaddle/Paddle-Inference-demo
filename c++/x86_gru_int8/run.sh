#!/bin/bash
mkdir -p build
cd build
rm -rf *

DEMO_NAME=model_test

WITH_MKL=ON
WITH_GPU=OFF
USE_TENSORRT=OFF

LIB_DIR=$1

cmake .. -DPADDLE_LIB=${LIB_DIR} \
      -DWITH_MKL=${WITH_MKL} \
        -DDEMO_NAME=${DEMO_NAME} \
          -DWITH_GPU=${WITH_GPU} \
            -DWITH_STATIC_LIB=OFF \

make -j

MODEL_DIR=/home/li/repo/Paddle-Inference-Demo/c++/x86_gru_int8/saved_int8_gru_infer_path
default_num_threads=1
default_with_accuracy=false
num_threads=${3:-$default_num_threads}
# with_accuracy_layer=${4:-$default_with_accuracy}

./${DEMO_NAME} \
    --model_dir=/home/li/repo/Paddle-Inference-Demo/c++/x86_gru_int8/saved_int8_gru_infer_path  \
    --threads=1 \

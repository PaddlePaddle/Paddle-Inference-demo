mkdir -p build
cd build
rm -rf *

DEMO_NAME=resnet50_trt_test

WITH_MKL=ON
WITH_GPU=ON
USE_TENSORRT=ON

LIB_DIR=YOUR_PADDLE_LIB_DIR
CUDNN_LIB=YOUR_CUDNN_LIB
CUDA_LIB=YOUR_CUDA_LIB
TENSORRT_ROOT=YOUR_TENSORRT_ROOT

cmake .. -DPADDLE_LIB=${LIB_DIR} \
  -DWITH_MKL=${WITH_MKL} \
  -DDEMO_NAME=${DEMO_NAME} \
  -DWITH_GPU=${WITH_GPU} \
  -DWITH_STATIC_LIB=OFF \
  -DUSE_TENSORRT=${USE_TENSORRT} \
  -DCUDNN_LIB=${CUDNN_LIB} \
  -DCUDA_LIB=${CUDA_LIB} \
  -DTENSORRT_ROOT=${TENSORRT_ROOT}

make -j

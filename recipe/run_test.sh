#!/bin/bash
set -ex

NVCC_FLAGS=""
# Workaround __ieee128 error; see https://github.com/LLNL/blt/issues/341
if [[ $target_platform == linux-ppc64le && $cuda_compiler_version == 10.* ]]; then
    NVCC_FLAGS+=" -Xcompiler -mno-float128"
fi

git clone https://github.com/NVIDIA/CUDALibrarySamples.git sample_linux/
cd sample_linux/cuTENSOR/
error_log=$(nvcc $NVCC_FLAGS --std=c++11 -I$PREFIX/include -L$PREFIX/lib -lcutensor -lcudart contraction.cu -o contraction 2>&1)
echo $error_log
error_log=$(nvcc $NVCC_FLAGS --std=c++11 -I$PREFIX/include -L$PREFIX/lib -lcutensor -lcudart reduction.cu -o reduction 2>&1)
echo $error_log

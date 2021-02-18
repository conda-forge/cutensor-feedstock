#!/bin/bash
set -ex


if [ $cuda_compiler_version == '11.0' ]; then
    conda create -n test cudatoolkit=11.1 cutensor
fi


git clone https://github.com/NVIDIA/CUDALibrarySamples.git sample_linux/
cd sample_linux/cuTENSOR/
error_log=$(nvcc -I$PREFIX/include -L$PREFIX/lib -lcutensor contraction.cu -o contraction 2>&1)
echo $error_log
error_log=$(nvcc -I$PREFIX/include -L$PREFIX/lib -lcutensor reduction.cu -o reduction 2>&1)
echo $error_log

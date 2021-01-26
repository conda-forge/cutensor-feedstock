#!/bin/bash
set -ex


git clone https://github.com/NVIDIA/CUDALibrarySamples.git sample_linux/
cd sample_linux/cuTENSOR/
which nvcc
ls -l .
ls -l $PREFIX/include
ls -l $PREFIX/lib
nvcc -I$PREFIX/include -L$PREFIX/lib -lcutensor contraction.cu -o contraction
nvcc -I$PREFIX/include -L$PREFIX/lib -lcutensor reduction.cu -o reduction

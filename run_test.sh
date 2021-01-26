#!/bin/bash
set -ex


git clone https://github.com/NVIDIA/CUDALibrarySamples.git sample_linux/
cd sample_linux/cuTENSOR/
nvcc contraction.cu -o contraction
nvcc reduction.cu -o reduction

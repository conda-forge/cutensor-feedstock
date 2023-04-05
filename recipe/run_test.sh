#!/bin/bash
set -ex

test -f $PREFIX/include/cutensor.h
test -f $PREFIX/include/cutensorMg.h
test -f $PREFIX/include/cutensor/types.h
test -f $PREFIX/lib/libcutensor.so
test -f $PREFIX/lib/libcutensorMg.so
# The tests below require CUDA 12 compilers, which are not yet available.
#${GCC} test_load_elf.c -std=c99 -Werror -ldl -o test_load_elf
#./test_load_elf $PREFIX/lib/libcutensor.so
#./test_load_elf $PREFIX/lib/libcutensorMg.so

#NVCC_FLAGS=""
## Workaround __ieee128 error; see https://github.com/LLNL/blt/issues/341
#if [[ $target_platform == linux-ppc64le && $cuda_compiler_version == 10.* ]]; then
#    NVCC_FLAGS+=" -Xcompiler -mno-float128"
#fi
#
#git clone https://github.com/NVIDIA/CUDALibrarySamples.git sample_linux/
#cd sample_linux/cuTENSOR/
#error_log=$(nvcc $NVCC_FLAGS --std=c++11 -I$PREFIX/include -L$PREFIX/lib -lcutensor -lcudart contraction.cu -o contraction 2>&1)
#echo $error_log
#error_log=$(nvcc $NVCC_FLAGS --std=c++11 -I$PREFIX/include -L$PREFIX/lib -lcutensor -lcudart reduction.cu -o reduction 2>&1)
#echo $error_log
#cd ../cuTENSORMg/
#error_log=$(nvcc $NVCC_FLAGS --std=c++11 -I$PREFIX/include -L$PREFIX/lib -lcutensorMg -lcutensor -lcudart contraction_multi_gpu.cu -o contraction_multi_gpu 2>&1)
#echo $error_log

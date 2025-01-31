#!/usr/bin/env bash
set -e

check-glibc lib/$CUDA_MAJOR/*.so*

export CUDA_MAJOR=${cuda_compiler_version%%.*}

mkdir -p $PREFIX/include
mv include/* $PREFIX/include/
mkdir -p $PREFIX/lib
mv lib/$CUDA_MAJOR/*.so* $PREFIX/lib/

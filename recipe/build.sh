#!/usr/bin/env bash
set -e

check-glibc lib/$cuda_major/*.so*

mkdir -p $PREFIX/include
mv include/* $PREFIX/include/
mkdir -p $PREFIX/lib
mv lib/$cuda_major/*.so* $PREFIX/lib/

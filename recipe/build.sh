#!/usr/bin/env bash
set -e

check-glibc lib/*.so*

mkdir -p $PREFIX/include
mv include/* $PREFIX/include/
mkdir -p $PREFIX/lib
mv lib/*.so* $PREFIX/lib/

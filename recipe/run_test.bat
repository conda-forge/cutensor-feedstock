@echo on
setlocal EnableDelayedExpansion


git clone "https://github.com/NVIDIA/CUDALibrarySamples.git" sample_linux
if errorlevel 1 exit 1

cd sample_linux\cuTENSOR

nvcc -I%LIBRARY_INC% -L%LIBRARY_LIB% -lcutensor contraction.cu -o contraction
if errorlevel 1 exit 1

nvcc -I%LIBRARY_INC% -L%LIBRARY_LIB% -lcutensor reduction.cu -o reduction
if errorlevel 1 exit 1

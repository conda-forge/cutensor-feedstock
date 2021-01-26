@echo on
setlocal EnableDelayedExpansion


git clone "https://github.com/NVIDIA/CUDALibrarySamples.git" sample_linux
cd sample_linux\cuTENSOR
call nvcc -I%LIBRARY_INC% -L%LIBRARY_LIB% -lcutensor contraction.cu -o contraction
call nvcc -I%LIBRARY_INC% -L%LIBRARY_LIB% -lcutensor reduction.cu -o reduction

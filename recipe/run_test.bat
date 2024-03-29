@echo on
setlocal EnableDelayedExpansion

if not exist %LIBRARY_INC%\\cutensor.h exit 1
if not exist %LIBRARY_INC%\\cutensorMg.h exit 1
if not exist %LIBRARY_INC%\\cutensor\\types.h exit 1
if not exist %LIBRARY_BIN%\\cutensor.dll exit 1
if not exist %LIBRARY_BIN%\\cutensorMg.dll exit 1
if not exist %LIBRARY_LIB%\\cutensor.lib exit 1
if not exist %LIBRARY_LIB%\\cutensorMg.lib exit 1

git clone "https://github.com/NVIDIA/CUDALibrarySamples.git" sample_linux
cd sample_linux\cuTENSOR
call nvcc -I%LIBRARY_INC% -L%LIBRARY_LIB% -lcutensor contraction.cu -o contraction
call nvcc -I%LIBRARY_INC% -L%LIBRARY_LIB% -lcutensor reduction.cu -o reduction
cd ..\cuTENSORMg
call nvcc -I%LIBRARY_INC% -L%LIBRARY_LIB% -lcutensorMg -lcutensor contraction_multi_gpu.cu -o contraction_multi_gpu

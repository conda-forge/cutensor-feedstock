@echo on

if not exist %PREFIX% mkdir %PREFIX%
if not exist %LIBRARY_PREFIX% mkdir %LIBRARY_PREFIX%
if not exist %LIBRARY_BIN% mkdir %LIBRARY_BIN%
if not exist %LIBRARY_LIB% mkdir %LIBRARY_LIB%
if not exist %LIBRARY_INC% mkdir %LIBRARY_INC%

copy include\cutensor.h %LIBRARY_INC%\
copy include\cutensorMg.h %LIBRARY_INC%\
mkdir %LIBRARY_INC%\cutensor
copy include\cutensor\types.h %LIBRARY_INC%\cutensor\
del lib\%cuda_major%\*static*
copy lib\%cuda_major%\*.dll %LIBRARY_BIN%\
copy lib\%cuda_major%\*.lib %LIBRARY_LIB%\

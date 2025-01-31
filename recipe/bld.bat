@echo on

if not exist %PREFIX% mkdir %PREFIX%
if errorlevel 1 exit 1
if not exist %LIBRARY_PREFIX% mkdir %LIBRARY_PREFIX%
if errorlevel 1 exit 1
if not exist %LIBRARY_BIN% mkdir %LIBRARY_BIN%
if errorlevel 1 exit 1
if not exist %LIBRARY_LIB% mkdir %LIBRARY_LIB%
if errorlevel 1 exit 1
if not exist %LIBRARY_INC% mkdir %LIBRARY_INC%
if errorlevel 1 exit 1

copy include\cutensor.h %LIBRARY_INC%\
if errorlevel 1 exit 1
copy include\cutensorMg.h %LIBRARY_INC%\
if errorlevel 1 exit 1
mkdir %LIBRARY_INC%\cutensor
if errorlevel 1 exit 1
copy include\cutensor\types.h %LIBRARY_INC%\cutensor\
if errorlevel 1 exit 1
del lib\%cuda_major%\*static*
if errorlevel 1 exit 1
copy lib\%cuda_major%\*.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1
copy lib\%cuda_major%\*.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1

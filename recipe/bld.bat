@echo on

:: Hack to free up additional space on Azure
:: Replace with conda-smithy solution when available
:: xref: https://github.com/conda-forge/conda-smithy/pull/1966
if "%CI%" == "azure" (
    set CLEANUP_DIRS=^
    C:\hostedtoolcache\windows;^
    ;

    mkdir C:\empty
    for %%f in (%CLEANUP_DIRS:;= %) do (
        if not [%%f] == [] (
        echo Removing %%f
        dir %%f
        robocopy /mir /mt /zb /ns /nc /nfl /ndl /np /njh /njs C:\empty %%f > nul 2>&1
        rmdir /q %%f
        )
    )
    rmdir /q C:\empty
)

if not exist %PREFIX% mkdir %PREFIX%
if not exist %LIBRARY_PREFIX% mkdir %LIBRARY_PREFIX%
if not exist %LIBRARY_BIN% mkdir %LIBRARY_BIN%
if not exist %LIBRARY_LIB% mkdir %LIBRARY_LIB%
if not exist %LIBRARY_INC% mkdir %LIBRARY_INC%

copy include\cutensor.h %LIBRARY_INC%\
copy include\cutensorMg.h %LIBRARY_INC%\
mkdir %LIBRARY_INC%\cutensor
copy include\cutensor\types.h %LIBRARY_INC%\cutensor\
del lib\{{ cuda_major }}\*static*
copy lib\{{ cuda_major }}\*.dll %LIBRARY_BIN%\
copy lib\{{ cuda_major }}\*.lib %LIBRARY_LIB%\

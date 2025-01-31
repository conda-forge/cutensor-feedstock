@echo on

:: Hack to free up additional space on Azure
:: Replace with conda-smithy solution when available
:: xref: https://github.com/conda-forge/conda-smithy/pull/1966
set CLEANUP_DIRS=^
C:\hostedtoolcache\windows;^
;
if "%CI%" == "azure" (
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
set CLEANUP_DIRS=

:: Afterwards run the normal Windows setup steps
call run_conda_forge_build_setup

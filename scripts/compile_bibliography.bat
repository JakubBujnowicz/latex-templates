@echo off

REM Check if both directories exist
if not exist "config\" (
    if not exist "bibliography\" (
        REM Change to the parent directory if either directory does not exist
        cd ..
    )
)

REM Run the R script
Rscript ./Rcode/compile_bibliography.R


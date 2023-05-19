@echo off
title Merger
color 1f

for /f "tokens=*" %%a in (SKUs.txt) do (
    pdftk %%a\*.pdf cat output %%a"_Merged.pdf"
)
pdftk *.pdf cat output Master_Merged.pdf
for /f "tokens=*" %%a in (SKUs.txt) do (
    echo ---------------------------
    echo %%a
    pdftk %%a"_Merged.pdf" dump_data | findstr NumberOfPages
    echo ---------------------------
)
echo ---------------------------
echo Master_Merged.pdf:
pdftk Master_Merged.pdf dump_data | findstr NumberOfPages
echo ---------------------------
pause
Master_Merged.pdf

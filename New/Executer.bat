@echo off
title Generating Merged PDFs
color 1f
echo Attempt: Removing all previous generated RTF and PDF files ...
del *.pdf
del NumberOfPages.rtf
pause
cls
for /f "tokens=*" %%a in (SKUs.txt) do (
echo Generating Merged PDF for %%a
    pdftk %%a\*.pdf cat output %%a"_Merged.pdf"
)
echo Generating Master Merged PDF
pdftk *.pdf cat output Master_Merged.pdf
pause
cls
for /f "tokens=*" %%a in (SKUs.txt) do (
    echo For %%a >> NumberOfPages.rtf
    pdftk %%a"_Merged.pdf" dump_data | findstr NumberOfPages >> NumberOfPages.rtf
)
echo For Master_Merged.pdf >> NumberOfPages.rtf
pdftk Master_Merged.pdf dump_data | findstr NumberOfPages >> NumberOfPages.rtf
title Generating Labels
gswin64c.exe                     ^
  -o Labels.pdf                 ^
  -sDEVICE=pdfwrite              ^
  -c "[/CropBox [190 460 405 814]" ^
  -c " /PAGES pdfmark"           ^
  -f Master_Merged.pdf
title Generating Invoices
gswin64c.exe                     ^
  -o Invoices.pdf                 ^
  -sDEVICE=pdfwrite              ^
  -c "[/CropBox [35 100 570 460]" ^
  -c " /PAGES pdfmark"           ^
  -f Master_Merged.pdf
title Done
echo Operation Finished!
pause
NumberOfPages.rtf

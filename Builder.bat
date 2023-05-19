@echo off
title -- AlamSirji's Epitomization Program v1.0 --
color 1f
echo Attempt: Main Date Directory
SET today=%date:~7,2%"-"%date:~-10,2%"-"%date:~-4,4%"-"PLUS1
mkdir %today%
pause
echo Attempt: Main Directory/<SKUs> Creation
cd %today%
for /f "tokens=*" %%a in (../SKUs.txt) do (
    mkdir "%%a"
)
echo Attempt: Executer, SKUs Replica
cd %today%
copy ..\Executer.bat Executer.bat
copy ..\SKUs.txt SKUs.txt
REM start Executer.bat
tree
pause
echo Attempt: Exit!
pause
REM ***************************************************************
REM * %1 = Source Region
REM * %2 = Target Region
REM * %3 = Port No.
REM * %4 = Base Workspace Folder
REM * %5 = Root Folder
REM *
REM ***************************************************************

rem Set Environment
rem echo off

cls
echo =========================================== > %2.out
echo === Enterprise test Server Region Clone === >> %2.out
echo =========================================== >> %2.out
echo. >> %2.out

REM ============================
REM Define environment variables
REM ============================

call mf_set_ip


REM "C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
"C:\MIcroFocus\EDz22\bin\cblpromp.exe" >> "%temp%\setenv.bat"
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

cd %4

md %2
cd %2
md System
md Projects
md Sources
cd system
md sysloadlib
md catalog
md rdef
md Logs
md loadlib

cd sysloadlib
copy %4\%1\system\sysloadlib\*.* 
cd..

cd rdef
copy %4\%1\BANKDEMO\system\rdef\*.* 
cd..

REM ****************************************************************************************
REM *   copy executables from source region
REM ****************************************************************************************

cd loadlib
copy %4\%1\system\loadlib\*.*
cd..

cd catalog
copy %4\%1\system\catalog\*.*

md data
cd data
copy %4\%1\system\catalog\data\*.*
cd..

md ctlcards
cd ctlcards
copy %4\%1\system\catalog\ctlcards\*.*
cd..

md prc
cd prc
copy %4\%1\system\catalog\prc\*.*
cd..
cd..
cd..

cd Sources
md cbl
md bms
md copybook
md jcl
md sql

cd..

cd system

echo Load Libraries and Data copied from %1 to %2 >> %2.out
echo.
 
mfds -x 5 %4\%2\system %1

echo Region details exported from %1 ...... Complete>> %2.out
echo. >> %2.out

call %5\Procedures\batchsubstitute %1 %2 %1.xml>temp.xml

REM ******************************************************************************************
REM *  Execute batchsubstitute between original two to look for all occurrences of 
REM *  "BankDemo" and change to new region name in XML file so new region could start without 
REM *  shutting source region down
REM *  Second execution to read tempa.xml instead of temp.xml
REM *****************************************************************************************

call %5\Procedures\batchsubstitute BankDemo %2 temp.xml>tempa.xml

call %5\Procedures\batchsubstitute 5556 %3 tempa.xml>%2.xml

echo XML file updated for %2 ...... Complete >> %2.out
echo. >> %2.out

mfds -g 5 %4\%2\system\%2.xml O

echo Region details imported for %2  ...... Complete>> %2.out
echo. >> %2.out

rem casstart /r%2

echo Region %2 started ...... Complete >> %2.out
echo. >> %2.out

echo Region Close Process completed with RC 00 >> %2.out

echo TAU:OutParm: %4\%2\system\%2.out

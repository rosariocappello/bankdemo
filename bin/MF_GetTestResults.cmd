REM ************************************************************
REM *
REM * %1 = Workspace Root Folder
REM *
REM ************************************************************
rem Set Environment
rem echo off

cd C:\MicroFocus\ESD\BANKDEV\Bankdemo\System\TestCover

cls
echo ============================================= > TCResults.out
echo === Enterprise test Server Region Reports === >> TCResults.out
echo ============================================= >> TCResults.out
echo. >> %1_Results.out

REM ============================
REM Define environment variables
REM ============================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"


set COBIDY=C:\MicroFocus\ESD\BANKDEV\Bankdemo\System\loadlib

TCreport BANKDEMO.tcz SOURCE

echo Test Coverage Reports created >> TCResults.out
echo.

echo Online Results Comparison created >> TCResults.out
echo.

cd %1\tests

profiler zbnkext1.ipf

cd C:\MicroFocus\ESD\BANKDEV\Bankdemo\System\Testcover

echo Performance Statistics Produced >> TCResults.out
echo.
 

echo TAU:OutParm: C:\MicroFocus\ESD\BANKDEV\Bankdemo\system\TestCover\TCResults.out C:\MicroFocus\ESD\BANKDEV\Bankdemo\System\TestCover\TCIndex.htm


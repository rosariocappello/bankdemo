echo off
REM ============================
REM Define environment variables
REM ============================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

cd C:\MicroFocus\ESD\BANKDEV\BankDemo\Sources\cbl

REM ============================================================================
REM Reset BBANK50P to the version without the 'sign' 
REM ============================================================================

if exist BBANK50P.CBL (
   del BBANK50P.CBL
   copy C:\MicroFocus\ESD\BANKDEV\Sources\base\BBANK50P.CBL BBANK50P.CBL
) else (
   copy C:\MicroFocus\ESD\BANKDEV\Sources\base\BBANK50P.CBL BBANK50P.CBL
)

REM ============================================================================
REM Modify the timestamp to force an automatic build
REM ============================================================================

copy /b BBANK50P.CBL +,,

casstop /lBANKTEST /w

REM ============================================================================
REM Copy the offline zServer Master Config to the Eclipse root folder
REM ============================================================================

cd \MicroFocus\ESD\BANKBASE\Model

copy MasterConfig.txt "C:\Users\Public\Micro Focus\Enterprise Developer\eclipse\MasterConfig.txt"

REM ============================================================================
REM Call Autobuild routine to recompile BBANK50P
REM ============================================================================

cd \MicroFocus\ESD\BANKBASE\Sync

Call Autobuild

echo Returncode: 00




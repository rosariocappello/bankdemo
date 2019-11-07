call mf_set_base
call mf_set_ip

rem Set Environment
rem echo off

REM ====================================================================
REM Template_Region is the base region from which everything gets copied
REM New_Region is the new region we are going to create
REM New_Region_Port_Number is the port number for the new region
REM ====================================================================

set BANKLEVEL=%1
set Old_Region=%2

cls
echo =========================================== > %New_Region%.out
echo === Enterprise Test Server Region Delete=== >> %New_Region%.out
echo =========================================== >> %New_Region%.out


REM ============================
REM Define environment variables
REM ============================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
 
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

cd %ESDEMO_BASE%\%BANKLEVEL%

IF EXIST %Old_Region% rd %Old_Region% /s /q

if %BASEIPADDR%==127.0.0.1 GOTO END

if %BANKLEVEL%==BANKDEV GOTO END

echo %BASEIPADDR%

net use r: \\%BASEIPADDR%\ESDemo_Base %ESDEMO_PASSWORD% /USER:%ESDEMO_USER%

R:

cd %BANKLEVEL%
IF EXIST %Old_Region% rd %Old_Region% /s /q

rem net use r: /d /y

:END
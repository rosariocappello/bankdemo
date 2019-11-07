call mf_set_base
call mf_set_ip

rem Set Environment
 echo on

REM ====================================================================
REM Template_Region is the base region from which everything gets copied
REM New_Region is the new region we are going to create
REM New_Region_Port_Number is the port number for the new region
REM ====================================================================

set BANKLEVEL=%1
set New_Region=%2
 
cls
echo =========================================== > %New_Region%.out
echo === Enterprise test Server Region update === >> %New_Region%.out
echo =========================================== >> %New_Region%.out
echo. >> %New_Region%.out

net use r: \\%BASEIPADDR%\ESDemo_Base %ESDEMO_PASSWORD% /USER:%ESDEMO_USER%

r:

if not exist s:\%BANKLEVEL%\%New_Region%\system\loadlib  mkdir %BANKLEVEL%\%New_Region%\system\loadlib

cd %BANKLEVEL%\%New_Region%\system\loadlib

copy C:\microfocus\esd\AccuRev_ws\bankdemo_vsam\loadlib\*.* 

rem 10 second  before disconnecting drive

ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null

net use r: /d /y
 
echo Data copied from Enterprise Developer  to %New_Region% >> %New_Region%.out
echo.
 
exit /b
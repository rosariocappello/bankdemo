@echo On
rem *********************************************
rem BMSGEN command file
rem *********************************************
rem
rem V00    - Initial Version    Rc    Mar '11    '
rem
rem *********************************************


setlocal

set drive=d:
set location=%drive%\testserver
set logfiledir=%location%\logs

set sourcelevel=%location%\BMSSRCE
set genbmslevel=%location%\BMSSRCE.GEN
set MFEOUTCPY=%location%\BMSSRCE_COPY

set MFELOADLIB=%location%\BMSLIB
set bmspgkey=%location%\BMSCOPY\PFKEYS.CPY

set loadlib=%location%\bin



rem set log file

set bmsgen_log=%logfiledir%\bmsload_log.txt

if not  exist %logfiledir%   md     %logfiledir%
if      exist %bmsgen_log%   del /q %bmsgen_log%

echo   drive=%DRIVE%
echo   sourcelevel=%sourcelevel%
echo   genbmslevel=%genbmslevel%



set bmsin=%sourcelevel%
set bmsout=%genbmslevel%


if not exist %BMSOUT%      md %BMSOUT%
if not exist %MFELOADLIB%  md %MFELOADLIB%
if not exist %MFEOUTCPY%   md %MFEOUTCPY%

if exist %BMSOUT%       del /q %BMSOUT%\*.bms
if exist %MFELOADLIB%   del /q %MFELOADLIB%\*.mod
if exist %MFEOUTCPY%    del /q %MFEOUTCPY%\*.cpy

for %%i in (%bmsin%\*.bms) do call :BMSGEN %%i

goto :EXIT


:BMSGEN

echo run bmsgen %~nx1                     >>%BMSgen_log%
   
run %LOADLIB%\bmspfk %bmsin%\%~nx1  %bmsout%\%~nx1 %bmspgkey%

echo ( %bmsin%\%~s1 rc=%ERRORLEVEL%)      >>%BMSGEN_log%

echo mfbmscl.exe  %bmsout%\%~nx1 /SDF /DP=. /SYSPARM=MAP /SYSPARM=DSECT /CS=$ /ASM="%MFEOUTCPY%/" /BINARY="%MFELOADLIB%/"   /verbose >>%bmsgen_log%

mfbmscl.exe  %bmsout%\%~nx1 /SDF /DP=. /SYSPARM=MAP /SYSPARM=DSECT /CS=$ /ASM="%MFEOUTCPY%/" /BINARY="%MFELOADLIB%/"   /verbose /COBOL="%MFEOUTCPY%"  >>%bmsgen_log%


goto :EOF



:Exit

endlocal

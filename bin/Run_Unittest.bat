@echo oN
setlocal ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
rem *********************************************
rem  MF unitTest  command file
rem *********************************************
rem
rem V00    - Initial Version    Rc    Feb '28    '
rem
rem *********************************************

set MF_DEBUG=N
set MF_PROJECT=%1

set MF_testcase=%2

call  :set_init_var
call  :set_MF_Env
call  :Run_UnitTest %MF_drive% TestCALLOAN
call  :Run_UnitTest %MF_drive% TestCALLOAN1
call  :Run_UnitTest %MF_drive% TestCALLOAN2

if /i .%MF_DEBUG%.  == .Y. (  
       pause
	   )

 
exit /b %rc%

:set_init_var

set MF_drive=C:


if /i .%MF_DEBUG%.  == .Y. (  
       pause
	   )
 
goto :EOF


:set_mf_env

if exist  %MF_TEMP_VAR_CMD%   del /q %MF_TEMP_VAR_CMD% 

if exist "%MF_driv%\Program Files (x86)"  set WVER=Program Files (x86)


set MF_TEMP_VAR_CMD=%temp%\mfsetenv-%RANDOM%-%TIME:~6,5%.bat
set MF_DEV=%MF_drive%\%WVER%\Micro Focus\Enterprise Developer\bin

@echo WVER=%WVER%                                                                        

"%MF_DEV%"\cblpromp.exe  >%MF_TEMP_VAR_CMD%
type %MF_TEMP_VAR_CMD%              
CALL %MF_TEMP_VAR_CMD%


del /q %MF_TEMP_VAR_CMD% 

if /i .%MF_DEBUG%.  == .Y. (  
       pause
	   )

goto :EOF

	   
:Run_UnitTest 

set local_drive=%1
set testcase_PGM=%2
set testcase_local=C:\bankdemo\RFEPORT\UnitTest-report_%testcase_PGM%.txt

%local_drive%

cd \bankdemo\vcprojs\banks\prod\Bank_prod\CALLOAN\bin\x86\Debug

del %testcase_local%

mfurun -verbose  %testcase_PGM%.DLL >>%testcase_local%

if %errorlevel% == 0 (
set rc=0) else (set rc=8) 
echo rc=%rc%
type %testcase_local%
 
if /i .%MF_DEBUG%.  == .Y. (  
       pause
	   ) 
goto :EOF
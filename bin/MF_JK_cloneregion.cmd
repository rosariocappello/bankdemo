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
set Template_Region=%2
set New_Region=%3
set New_Region_Port_Number=%4
set Import_Region=%5

cls
echo =========================================== > %New_Region%.out
echo === Enterprise test Server Region Clone === >> %New_Region%.out
echo =========================================== >> %New_Region%.out
echo. >> %New_Region%.out

REM ============================
REM Define environment variables
REM ============================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe"  >>"%temp%\setenv.bat"
 
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

cd %ESDEMO_BASE%\%BANKLEVEL%

if not exist %New_Region%  md %New_Region%
cd %New_Region%

if not exist  System    md System
if not exist  Projects  md Projects
if not exist  Sources   md Sources

cd source 

if not exist sysloadlib md sysloadlib
if not exist catalog    md catalog
if not exist rdef       md rdef
if not exist Logs       md Logs
if not exist loadlib    md loadlib
if not exist Tests      md Tests
if not exist TestCover  md TestCover
if not exist CobConfig  md CobConfig
if not exist TCStats    md TCStats

cd system

if not exist ASM         md ASM
if not exist BMS         md BMS
if not exist CBL         md CBL
if not exist COPYBOOK    md COPYBOOK
if not exist CSD         md CSD
if not exist jcl         md jcl
if not exist JclProc     md JclProc
if not exist macros      md macros
if not exist prc         md prc
if not exist SYSCOPYBOOK md SYSCOPYBOOK
						   
cd  .. 
						   
cd sysloadlib

copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\sysloadlib\*.* 
cd..

cd rdef

copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\rdef\*.* 
cd..

cd TestCover


copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\TestCover\*.* 
cd..

cd CobConfig


copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\CobConfig\*.* 
cd..

cd TCStats
 
copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\TCstats\*.* 
cd..


cd catalog

copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\catalog\*.*

if not exist data md data
cd data

copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\catalog\data\*.*

if not exist Baseline_Data md Baseline_Data
cd Baseline_Data

copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\catalog\data\Baseline_Data\*.*
cd..
cd..

if not exist ctlcards md ctlcards
cd ctlcards

copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\catalog\ctlcards\*.*
cd..

if not exist prc md prc
cd prc

copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%\system\catalog\prc\*.*
cd..
cd..
cd..

If %Import_Region%==N Goto COPY
	
rem cd..

cd system

echo Data copied from %Template_Region% to %New_Region% >> %New_Region%.out
echo.
 
rem call %ESDEMO_BASE%\BANKBASE\Procedures\mf_JK_ImportRegion %BANKLEVEL% %Template_Region% %New_Region% %New_Region_Port_Number%

:COPY

if %BASEIPADDR%==127.0.0.1 GOTO END

if %BANKLEVEL%==BANKDEV GOTO END

echo %BASEIPADDR%

if exist R: net use r: /d /y

net use r: \\%BASEIPADDR%\ESDemo_Base %ESDEMO_PASSWORD% /USER:%ESDEMO_USER%

R:

cd %BANKLEVEL%

if not exist %New_Region% md %New_Region%

cd %New_Region%

del /q  %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\*.cpy
del /q  %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\system\logs\*.*

if not exist system  mkdir system
cd system

@echo xcopy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\system\*.* /s/v/e/h/y  
      xcopy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\system\*.* /s/v/e/h/y
cd ..
if not exist Projects  mkdir Projects
cd Projects

@echo xcopy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\Projects\*.* /s/v/e/h/y
      xcopy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\Projects\*.* /s/v/e/h/y

cd ..
if not exist sources  mkdir sources
cd sources 
 
if not exist ASM         md ASM
if not exist BMS         md BMS
if not exist CBL         md CBL
if not exist COPYBOOK    md COPYBOOK
if not exist CSD         md CSD
if not exist jcl         md jcl
if not exist JclProc     md JclProc
if not exist macros      md macros
if not exist prc         md prc
if not exist SYSCOPYBOOK md SYSCOPYBOOK

cd  ASM
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\ASM\*.*
cd ..
cd  BMS                                              
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\BMS\*.*
cd ..
cd  CBL                                              
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\CBL\*.*
cd ..
cd  COPYBOOK                                         
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\COPYBOOK\*.*
cd ..
cd  CSD                                              
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\CSD\*.*
cd ..
cd  jcl                                              
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\jcl\*.*
cd ..
cd  JclProc                                          
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\JclProc\*.*
cd ..
cd  macros                                           
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\macros\*.*
cd ..
cd  prc                                              
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\prc\*.*
cd ..
cd  SYSCOPYBOOK                                      
copy %ESDEMO_BASE%\%BANKLEVEL%\%New_Region%\sources\SYSCOPYBOOK\*.*
cd ..

rem 10 second  before disconnecting drive

ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null

c:

net use r: /d /y
 
echo Data copied from %Template_Region% to %New_Region% >> %New_Region%.out
echo.
 
if %Import_Region%==Y  call %ESDEMO_BASE%\BANKBASE\Procedures\mf_JK_ImportRegion %BANKLEVEL% %Template_Region% %New_Region% %New_Region_Port_Number%
   

:END

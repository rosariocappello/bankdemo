

set ES_REGION=%1



if exist "%temp%\EXPsetenv.bat"  del /q "%temp%\EXPsetenv.bat"

set intdriv=c:
set DataDriv=C:
set WVER=Program Files

set ES_REGION_DIR=%DataDriv%\bankdemo\regions\
set ES_REGION_LOC=%ES_REGION_DIR%\%ES_REGION%
set XDBDATA_DIR=%ES_REGION_DIR%\LOGS

if not exist "%XDBDATA_DIR%"  md  "%XDBDATA_DIR%"

set XDBDATA_FIL=%ES_REGION%_Start_log.txt
set XDBDATA_log=%XDBDATA_DIR%\%XDBDATA_FIL%
del /q %XDBDATA_log%

@echo %ES_REGION%                          >>%XDBDATA_log%
@echo %ES_REGION_LOC%                      >>%XDBDATA_log%
@echo Starting %ES_REGION% for %USERNAME%  >>%XDBDATA_log%
@echo date and time are                    >>%XDBDATA_log%
date /T                                    >>%XDBDATA_log%
time /T                                    >>%XDBDATA_log%

if exist "%intdriv%\Program Files (x86)"  set WVER=Program Files (x86)

@echo WVER=%WVER%                                                                          >>%XDBDATA_log%

if exist "%intdriv%\%WVER%\Micro Focus\Enterprise Developer\bin" (    
  @echo  found Enterprise Developer                                                        >>%XDBDATA_log%
         "%intdriv%\%WVER%\Micro Focus\Enterprise Developer\bin\"cblpromp.exe              >"%temp%\EXPsetenv.bat"
  @echo  "%intdriv%\%WVER%\Micro Focus\Enterprise Developer\bin"                           >>%XDBDATA_log%
         set set_mf_bin="%intdriv%\%WVER%\Micro Focus\Enterprise Developer\bin"
		 type "%temp%\EXPsetenv.bat"                                                       >>%XDBDATA_log%
		 )
		 
if exist "%intdriv%\%WVER%\Micro Focus\Enterprise Test Server\bin" (
  @echo  found Enterprise Test Server                                                      >>%XDBDATA_log%
         "%intdriv%\%WVER%\Micro Focus\Enterprise Test Server\bin\"cblpromp.exe             >"%temp%\EXPsetenv.bat"
  @echo  "%intdriv%\%WVER%\Micro Focus\Enterprise Test Server\bin"                          >>%XDBDATA_log%
         set set_mf_bin="%intdriv%\%WVER%\Micro Focus\Enterprise Test Server\bin"
		 type "%temp%\EXPsetenv.bat"                                                        >>%XDBDATA_log%
         )
		 
if exist "%temp%\EXPsetenv.bat" (
  @echo  setting MF Environment                                                            >>%XDBDATA_log%
   call "%temp%\EXPsetenv.bat"
    )
	
rem pause


CASSTOP /r%1 /W30


rem SETLOCAL EnableExtensions
set EXE=casmgr.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto FOUND
@echo Casmgr is Not running                       >>%XDBDATA_log%
 echo Casmgr is Not running                
goto FIN
:FOUND

@echo Casmgr is  running                          >>%XDBDATA_log%
 echo Casmgr is  running     

@echo TASKKILL /F /IM CASMGR.EXE                  >>%XDBDATA_log%
      TASKKILL /F /IM CASMGR.EXE

	  @echo TIMEOUT /T 10                        >>%XDBDATA_log%
ping 127.0.0.1 >null
ping 127.0.0.1 >null
ping 127.0.0.1 >null
ping 127.0.0.1 >null
ping 127.0.0.1 >null
ping 127.0.0.1 >null
ping 127.0.0.1 >null
ping 127.0.0.1 >null
ping 127.0.0.1 >null
ping 127.0.0.1 >null

:FIN
	
	
rem PAUSE
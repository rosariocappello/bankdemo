@echo on

set MF_INSTALL_SW=C:\Program Files (x86)\Micro Focus\Enterprise Test Server
set MF_MFDS_LOC=C:\ProgramData\Micro Focus\Enterprise Developer
set Zip_loc=C:\Program Files\7-Zip
set INST_BASE=C:\Microfocus\ESD\BANKBASE\Procedures
set INST_dir=%INST_BASE%\logs
set INST_log=%INST_dir%\Reset_MFDS.txt
rem set M_Prefix=SERVER_full
REM set M_Prefix=server_empty
SET M_Prefix=server_%1

if exist "%temp%\EXPsetenv.bat"  del /q "%temp%\EXPsetenv.bat"

set intdriv=c:
set DataDriv=C:
set WVER=Program Files

set ES_REGION_DIR=%DataDriv%\microfocus\esd\BANKTEST
set ES_REGION_LOC=%ES_REGION_DIR%\%ES_REGION%
set XDBDATA_DIR=%ES_REGION_DIR%\LOGS

if not exist "%XDBDATA_DIR%"  md  "%XDBDATA_DIR%"

set XDBDATA_FIL=%ES_REGION%_Start_log.txt
set XDBDATA_log=%XDBDATA_DIR%\%XDBDATA_FIL%
del /q %INST_log%

@echo %ES_REGION%                          >>%INST_log%
@echo %ES_REGION_LOC%                      >>%INST_log%
@echo Starting %ES_REGION% for %USERNAME%  >>%INST_log%
@echo date and time are                    >>%INST_log%
date /T                                    >>%INST_log%
time /T                                    >>%INST_log%

if exist "%intdriv%\Program Files (x86)"  set WVER=Program Files (x86)

@echo WVER=%WVER%                                                                          >>%INST_log%

if exist "%intdriv%\%WVER%\Micro Focus\Enterprise Developer\bin" (    
  @echo  found Enterprise Developer                                                        >>%INST_log%
         "%intdriv%\%WVER%\Micro Focus\Enterprise Developer\bin\"cblpromp.exe              >"%temp%\EXPsetenv.bat"
  @echo  "%intdriv%\%WVER%\Micro Focus\Enterprise Developer\bin"                           >>%INST_log%
         set set_mf_bin="%intdriv%\%WVER%\Micro Focus\Enterprise Developer\bin"
		 type "%temp%\EXPsetenv.bat"                                                       >>%INST_log%
		 )
		 
if exist "%intdriv%\%WVER%\Micro Focus\Enterprise Test Server\bin" (
  @echo  found Enterprise Test Server                                                      >>%INST_log%
         "%intdriv%\%WVER%\Micro Focus\Enterprise Test Server\bin\"cblpromp.exe             >"%temp%\EXPsetenv.bat"
  @echo  "%intdriv%\%WVER%\Micro Focus\Enterprise Test Server\bin"                          >>%INST_log%
         set set_mf_bin="%intdriv%\%WVER%\Micro Focus\Enterprise Test Server\bin"
		 type "%temp%\EXPsetenv.bat"                                                        >>%INST_log%
         )
		 
if exist "%temp%\EXPsetenv.bat" (
  @echo  setting MF Environment                                                            >>%INST_log%
   call "%temp%\EXPsetenv.bat"
    )
	
rem pause

rem SETLOCAL EnableExtensions
set EXE=casmgr.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto FOUND
@echo Casmgr is Not running                 >>%INST_log%
 echo Casmgr is Not running                
goto FIN
:FOUND

@echo Casmgr is  running                          >>%INST_log%
 echo Casmgr is  running     

@echo TASKKILL /F /IM CASMGR.EXE                  >>%INST_log%
      TASKKILL /F /IM CASMGR.EXE

	  @echo TIMEOUT /T 10                        >>%INST_log%
TIMEOUT /T 10


if not exist %INST_dir% mkdir %INST_dir%
if EXIST %INST_log%     del /q %INST_log%

echo net stop  "Micro Focus Directory Server"                                         >>%INST_log%
     net stop  "Micro Focus Directory Server"

IF EXIST "%MF_MFDS_LOC%\MFDS" (


   echo  reset Mfds in "%MF_MFDS_LOC%\MFDS"                                            >>%INST_log%  
   echo  del /q /s "%MF_MFDS_LOC%"\MFDS\*.*                                               >>%INST_log% 
         del /q /s "%MF_MFDS_LOC%"\MFDS\*.*

   echo "%Zip_loc%\7z" x -r -aoa -o"%MF_MFDS_LOC%\" %INST_BASE%\MFDS_%M_Prefix%.7z    >>%INST_log% 
        "%Zip_loc%\7z" x -r -aoa -o"%MF_MFDS_LOC%\" %INST_BASE%\MFDS_%M_Prefix%.7z *
		  
)

@echo net start "Micro Focus Directory Server"                                          >>%INST_log%
      net start "Micro Focus Directory Server"
	  
@echo del /s /q C:\Microfocus\ESD\BANKTEST\BANKFUNC\*.*                                 >>%INST_log%

del /s /q   C:\Microfocus\ESD\BANKTEST\BANKFUNC\*.* 
rmdir /s /q C:\Microfocus\ESD\BANKTEST\BANKFUNC\
rmdir /s /q C:\Microfocus\ESD\BANKTEST\BANKFUNC\

pause
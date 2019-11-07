@echo On
rem *********************************************
rem mfsGEN command file
rem *********************************************
rem
rem V00    - Initial Version    Rc    Aug '11    '
rem
rem *********************************************


setlocal

set drive=d:
set location=%drive%\testserver
set logfiledir=%location%\log

SET ES_ACBLIB=%location%\imslib  
SET ES_IMSCFG=%location%\imslib  
SET ES_IMSDAT=%location%\imslib  
SET ES_IMSLIB=%location%\imslib  
SET ES_IMS_PATH=%location%\imslib  
set      IMSLIB=%location%\IMSLIB
set listdir=%location%\imslist



set smfs=%location%\SOURCE\SRCMANG\NDP\PROD\MFSSORC
set spsb=%location%\SOURCE\SRCMANG\NDP\PROD\PSBSORC
set sdbd=%location%\SOURCE\SRCMANG\NDP\PROD\dbdSORC

rem set log file

set mfsgen_log=%logfiledir%\mfsload_log.txt
set dbdgen_log=%logfiledir%\dbdload_log.txt
set psbgen_log=%logfiledir%\psbload_log.txt


if not  exist %logfiledir%   md     %logfiledir%
if not  exist %listdir%      md     %listdir%
if not  exist %IMSLIB%       md     %IMSLIB%  



if      exist %mfsgen_log%    del /q %mfsgen_log%
if      exist %dbdgen_log%    del /q %dbdgen_log%
if      exist %psbsgen_log%   del /q %psbgen_log%



for %%i in (%sdbd%\*.dbd)   do call :dbdgen %%i


:endDBD

pause

for %%i in (%smfs%\*.mfs)  do call :mfsGEN %%i

:endMFS

pause


for %%i in (%spsb%\*.psb)  do call :psbGEN %%i

:endpsb

pause

goto :Exit


:mfsGEN

echo run mfsgen %~nx1                     >>%mfsgen_log%
   

echo MFIMS.EXE MFSGEN %smfs%\%~nx1 ECHO(ERREND,4,50) LIST"%listdir%\*.LST" STACKAUTO /PATH"%ES_IMSLIB%" COPYEXT(MFS,CPY) >>%mfsgen_log%


MFIMS.EXE MFSGEN %smfs%\%~nx1 ECHO(ERREND,4,50) LIST"%listdir%\*.LST" STACKAUTO /PATH"%ES_IMSLIB%" COPYEXT(MFS,CPY)

echo ( %smfs%\%~s1 rc=%ERRORLEVEL%)      >>%mfsGEN_log%


goto :eof


:DBDGEN

echo run dbdgen %~nx1                     >>%dbdgen_log%
   

echo MFIMS.EXE DBDGEN %sdbd%\%~nx1 ECHO(ERREND,4,50) LIST"%listdir%\*.LST" MAP COPYEXT(DBD,CPY) >>%dbdgen_log%


MFIMS.EXE DBDGEN %sdbd%\%~nx1 ECHO(ERREND,4,50) LIST"%listdir%\*.LST" MAP COPYEXT(DBD,CPY)

echo ( %sdbd%\%~s1 rc=%ERRORLEVEL%)                >>%dbdGEN_log%
 


goto :eof


:PSBGEN

echo run psbgen %~nx1                     >>%psbgen_log%

echo MFIMS.EXE PSBGEN  %spsb%\%~nx1 ECHO(ERREND,4,50) LIST"%listdir%\*.LST" VERIFY COPYEXT(PSB,CPY) >>%psbgen_log%

MFIMS.EXE PSBGEN  %spsb%\%~nx1 ECHO(ERREND,4,50) LIST"%listdir%\*.LST" VERIFY COPYEXT(PSB,CPY)

echo ( %spsb%\%~s1 rc=%ERRORLEVEL%)      >>%psbGEN_log%


goto :eof


:Exit

endlocal

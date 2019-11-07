Call MF_Set_Base

@echo ------------------------------------------------------------
@echo %~nx0 starting, %date% %time%
@echo 0=%0

set BANKLEVEL=%1
set Sync_count=%2

@rem -------------------------
@rem Ensure MFA Client can be found on PATH
@rem -------------------------
set PATH=c:\Program files (x86)\Micro Focus\Enterprise Developer\bin;%PATH%

@rem -------------------------
@rem Change current directory below for testing or live execution
@rem -------------------------
     cd /d "%ESDEMO_BASE%\BANKBASE\Sync"

rem ******************************************************************************************
rem   added execution of batchsubstitute to look for all occurrences of "BANKBASE" in  
rem   ETSBuildConfig-Baseline.xml and change this to new region name  
rem ****************************************************************************************

call %ESDEMO_BASE%\BANKBASE\Procedures\batchsubstitute BANKLEVEL %BANKLEVEL% %ESDEMO_BASE%\BANKBASE\Sync\mfmon.cfg>%ESDEMO_BASE%\BANKBASE\Sync\mfmon_temp.cfg

call %ESDEMO_BASE%\BANKBASE\Procedures\batchsubstitute ESDEMO %ESDEMO_BASE% %ESDEMO_BASE%\BANKBASE\Sync\mfmon_temp.cfg>%ESDEMO_BASE%\BANKBASE\Sync\mfmon_tempa.cfg

call %ESDEMO_BASE%\BANKBASE\Procedures\batchsubstitute SYNC_COUNT %SYNC_COUNT% %ESDEMO_BASE%\BANKBASE\Sync\mfmon_tempa.cfg>%ESDEMO_BASE%\BANKBASE\Sync\mfmon_%BANKLEVEL%.cfg

     del .\MFAComplete.txt 2>NUL
     mfmonmx %_nogui% /AUTOLOGON /CFGFILE=.\mfmon_%BANKLEVEL%.cfg /DATFILE=.\mfmon_%BANKLEVEL%.dat /LOGFILE=.\mfmon_%BANKLEVEL%.log /ERRFILE=.\mfmon_%BANKLEVEL%.err /RULEFILE=.\monrule_%BANKLEVEL%.ini
     @set _rc=%errorlevel%

@echo %~nx0 finishing, %date% %time%
exit /b %_rc%
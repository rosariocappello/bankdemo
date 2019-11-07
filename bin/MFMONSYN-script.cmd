call mf_set_base

@setlocal 
@echo on
@rem *
@rem * This command file is driven by the MFMONSYN exit at the tail of an MFA SyncMon
@rem * processing.  This command file is used to allow easy changes to the actual
@rem * post-processing commands without having to recompile the mfmonsyn.gnt program.
@rem *  
@rem * This batch file should execute syncronously (mfdasmx.exe/mfmonsyn.gnt should wait 
@rem * for it to finish).
@rem * 
@rem * This script must be called mfmonsyn-script.cmd, and be located in the "current
@rem * directory.  Output is logged to .\mfmonsyn-script.log
@rem *

@set wRCMAX=0
@echo ------------------------------------------------------------
@echo MFMONSYN-script.cmd starting, %date% %time%

@rem * In case script is run standalone, setup path to ensure MFA Client can be found
@rem * and switch focus to directory containing this script.
set PATH=c:\Program files (x86)\Micro Focus\Mainframe Access\bin;%PATH%

cd %ESDEM_BASE\BANKBASE\Sync

del Build.Log


@REM ===============================================
@REM stop region to ensure Loadlib DLLs are unlocked
@REM ===============================================

@REM casstop /lBANKTEST /w


Call Autobuild


@REM casstart /rBANKTEST


@rem * Create a zero-length semaphore file that indicates to Enterprise Architect that
@rem * the sync is complete.
@if %wRCMAX% EQU 0 (type NUL>".\MFAComplete.txt"
) else (@echo Errors found - Not writing MFAComplete.txt)
@echo.

@echo MFMONSYN-script.cmd exiting, %date% %time%, maxrc=%wRCMAX%
@exit /b %wRCMAX%


Call MF_Set_Base


Rem ********************************************************
Rem * Perform Synch of PROD and TEST Source                *
Rem ********************************************************

Call %ESDEMO_BASE%\BANKBASE\Procedures\Start_Sync BANKPROD 1
Call %ESDEMO_BASE%\BANKBASE\Procedures\Start_Sync BANKTEST 1

Rem ********************************************************
Rem * Create Directory Structure for PROD and TEST baseline*
REM ********************************************************

Call %ESDEMO_BASE%\BANKBASE\Procedures\MF_JK_Cloneregion BANKPROD BANKPROD BANKPROD 5555 N
Call %ESDEMO_BASE%\BANKBASE\Procedures\MF_JK_Cloneregion BANKTEST BANKTEST BANKTEST 5555 N


Call %ESDEMO_BASE%\BANKBASE\Procedures\autobuild BANKPROD BANKPROD BANKPROD BUILDALL
Call %ESDEMO_BASE%\BANKBASE\Procedures\autobuild BANKTEST BANKTEST BANKTEST BUILDALL


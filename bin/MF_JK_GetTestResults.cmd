call mf_set_ip

rem Set Environment
rem echo off
rem c:
cd %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\TestCover

cls
echo ============================================= > TCResults.out
echo === Enterprise test Server Region Reports === >> TCResults.out
echo ============================================= >> TCResults.out
echo. >> %1_Results.out

REM ============================
REM Define environment variables
REM ============================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

if %BASEIPADDR%==127.0.0.1 GOTO LOCAL

:REMOTE

echo %BASEIPADDR%

net use t: \\%BASEIPADDR%\ESDemo_Base %ESDEMO_PASSWORD% /USER:%ESDEMO_USER%

set COBIDY=t:\%BANKLEVEL%\%Test_Region%\System\loadlib

del *.txt
del *.htm

TCreport t:\%BANKLEVEL%\%Test_Region%\System\TestCover\BANKDEMO.tcz SOURCE TEXT

echo Test Coverage Reports created >> TCResults.out
echo.

cd ..\tests

IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank10p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank10p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank20p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank20p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank30p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank30p.ipf 
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank35p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank35p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank40p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank40p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank50p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank50p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank60p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank60p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank70p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank70p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank80p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank80p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank90p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank90p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank99p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbank99p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbankzzp.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bbankzzp.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bcash00p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bcash00p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bcash01p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bcash01p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bcash02p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bcash02p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bcash03p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bcash03p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bdemo10p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bdemo10p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\bdemo99p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\bdemo99p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbankiop.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbankiop.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank01p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank01p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank02p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank02p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank03p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank03p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank04p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank04p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank05p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank05p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank06p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank06p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank07p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank07p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank08p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank08p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank09p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank09p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank11p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank11p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank51p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank51p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank52p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dbank52p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dcash01p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dcash01p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dcash02p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dcash02p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\dhelp01p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\dhelp01p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank00p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank00p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank10p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank10p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank20p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank20p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank30p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank30p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank35p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank35p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank40p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank40p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank50p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank50p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank60p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank60p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank70p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank70p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank80p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank80p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank90p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank90p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank99p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sbank99p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\scustomp.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\scustomp.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo00p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo00p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo10p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo10p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo99p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo99p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\spswd01p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\spswd01p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\ssecurep.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\ssecurep.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sstmt01p.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sstmt01p.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\STRAC00P.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\STRAC00P.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\sversonp.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\sversonp.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbankulp.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbankulp.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnke15.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnke15.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnke35.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnke35.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkext1.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkext1.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkprt1.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkprt1.ipf
IF EXIST t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkprt2.ipf profiler t:\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkprt2.ipf

copy t:\%BANKLEVEL%\%Test_Region%\System\Tests\*.prf *.prx

cd ..\tcstats

%ESDEMO_BASE%\BANKBASE\TCStats\bin\tcstats %1 %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\TCStats\TCStats.ini

echo Online Results Comparison created >> TCResults.out
echo.

cd ..\Testcover

echo Performance Statistics Produced >> TCResults.out
echo.

net use t: /d /y

GOTO END

:LOCAL

set COBIDY=%ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\loadlib

cd %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\TestCover

del *.txt
del *.htm

TCreport %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\TestCover\BANKDEMO.tcz SOURCE TEXT

echo Test Coverage Reports created >> TCResults.out
echo.

cd %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests

IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank10p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank10p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank20p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank20p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank30p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank30p.ipf 
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank35p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank35p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank40p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank40p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank50p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank50p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank60p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank60p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank70p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank70p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank80p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank80p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank90p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank90p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank99p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbank99p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbankzzp.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bbankzzp.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bcash00p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bcash00p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bcash01p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bcash01p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bcash02p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bcash02p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bcash03p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bcash03p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bdemo10p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bdemo10p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bdemo99p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\bdemo99p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbankiop.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbankiop.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank01p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank01p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank02p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank02p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank03p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank03p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank04p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank04p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank05p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank05p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank06p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank06p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank07p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank07p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank08p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank08p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank09p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank09p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank11p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank11p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank51p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank51p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank52p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dbank52p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dcash01p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dcash01p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dcash02p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dcash02p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dhelp01p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\dhelp01p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank00p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank00p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank10p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank10p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank20p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank20p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank30p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank30p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank35p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank35p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank40p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank40p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank50p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank50p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank60p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank60p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank70p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank70p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank80p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank80p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank90p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank90p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank99p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sbank99p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\scustomp.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\scustomp.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo00p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo00p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo10p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo10p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo99p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sdemo99p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\spswd01p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\spswd01p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\ssecurep.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\ssecurep.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sstmt01p.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sstmt01p.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\STRAC00P.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\STRAC00P.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sversonp.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\sversonp.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbankulp.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbankulp.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnke15.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnke15.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnke35.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnke35.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkext1.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkext1.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkprt1.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkprt1.ipf
IF EXIST %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkprt2.ipf profiler %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\zbnkprt2.ipf

copy %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\Tests\*.prf *.prx

cd %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\TCstats

%ESDEMO_BASE%\BANKBASE\TCStats\bin\tcstats %1 %ESDEMO_BASE%\BANKBASE\TCStats\TCStats.ini

pause 

echo Online Results Comparison created >> TCResults.out
echo.

cd %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\testcover

echo Performance Statistics Produced >> TCResults.out
echo.

rem net use t: /d /y

GOTO END

:END
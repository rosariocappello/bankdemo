call mf_set_ip

rem Set Environment
rem echo off
rem c:
cd %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\TCstats

cls
echo ============================================= > TCResults.out
echo === Enterprise test Server Region Reports === >> TCResults.out
echo ============================================= >> TCResults.out

REM ============================
REM Define environment variables
REM ============================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

cd %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\TCStats

%ESDEMO_BASE%\BANKBASE\TCStats\Bin\TCcomp.exe %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\TCStats\%test1_name%-tc-reports.txt %ESDEMO_BASE%\%BANKLEVEL%\%Test_Region%\System\TCStats\%test2_name%-tc-reports.txt
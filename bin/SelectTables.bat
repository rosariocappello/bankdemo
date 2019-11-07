rem @echo off
rem Create Visual COBOL Environment
set entdev=C:\Program Files (x86)\Micro Focus\Enterprise Developer
"%entdev%\bin\cblpromp.exe" >> "setenv.bat"

call "setenv.bat"
rem del /q "%temp%\setenv.bat"
rem check for vista and server 2008 documents folder
if exist C:\MFETDUSER\BankDemo\Projects\Eclipse\InternalTaurusProj\My_Environment\BANKDEMO_Explorer_1.0\Tablelist.fre del C:\MFETDUSER\BankDemo\Projects\Eclipse\InternalTaurusProj\My_Environment\BANKDEMO_Explorer_1.0\tablelist.fre
xwiz40n c:\taurusint\bin\SelectTables.exp

set tablist=C:\MFETDUSER\BankDemo\Projects\Eclipse\InternalTaurusProj\My_Environment\BANKDEMO_Explorer_1.0\Tablelist.fre del C:\MFETDUSER\BankDemo\Projects\Eclipse\InternalTaurusProj\My_Environment\BANKDEMO_Explorer_1.0\tablelist.fre

for /f "delims=, tokens=1-3" %%i in (%tablist%) do call :addSuffix %%i %%j %%k

goto :eof

:addsuffix

echo %1 , %2 , %3 ,MFTABNM > C:\MFETDUSER\BankDemo\Projects\Eclipse\InternalTaurusProj\My_Environment\BANKDEMO_Explorer_1.0\Tablelist.fre del C:\MFETDUSER\BankDemo\Projects\Eclipse\InternalTaurusProj\My_Environment\BANKDEMO_Explorer_1.0\tablelist.out

C: 


cd mfetsuser\bankdemo\system\tests

REM ============================
REM Define environment variables
REM ============================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

Rumbapage C:\MFETSUSER\BankDemo\System\Tests\banktestInit.rsdm

cd \MFETSUSER\BankDemo\System\Tests\

 
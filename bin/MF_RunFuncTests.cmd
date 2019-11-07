C: 


cd mfetsuser\bankdemo\system\tests

REM ============================================================
REM 1) Define environment variables
REM 2) Delete Screen (Rumba) print file
REM 3) Reset baseline data
REM 4) Run Rumba Session (configures printer etc. and macro file 
REM ============================================================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

del /q C:\MFETSUSER\BankDemo\System\Tests\BankDemo_Func_Test1.txt

copy /y C:\MFETSUSER\BankDemo\System\catalog\data\Baseline_Data\*.* C:\MFETSUSER\BankDemo\System\catalog\data\ 

Rumbapage C:\MFETSUSER\BankDemo\System\Tests\BANKDEMO_Func_Test1.rsdm

cd \MFETSUSER\BankDemo\System\Tests\

 
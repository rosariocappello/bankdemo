C: 


cd mfetsuser\bankdemo\system\tests

REM ============================
REM Define environment variables
REM ============================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

del /q C:\MFETSUSER\BankDemo\System\Tests\fileprnt.txt

copy /y C:\MFETSUSER\BankDemo\System\catalog\data\Baseline_Data\*.* C:\MFETSUSER\BankDemo\System\catalog\data\ 

Rumbapage C:\MFETSUSER\BankDemo\System\Tests\banktest.rsdm

cassub /rBANKTEST /jC:\MFETSUSER\BankDemo\Sources\jcl\ZBNKSTMT.jcl > c:\MFETSUSER\BankDemo\System\Tests\sub.txt

cd \MFETSUSER\BankDemo\System\Tests\

 
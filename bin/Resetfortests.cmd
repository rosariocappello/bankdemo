C: 


cd mfetsuser\bankdemo\system\tests

REM ============================
REM Define environment variables
REM ============================

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe" >> "%temp%\setenv.bat"
call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

casstop /lBANKTST2
casstop /lBANKTEST /w

del c:\mfetsuser\bankdemo\system\catalog\mvsjobds.dat
del fileprnt.txt
del *.ipf
del *.prf
del c:\mfetsuser\bankdemo\system\testcover\bankdemo.tcz
del c:\mfetsuser\bankdemo\system\testcover\*.htm

casstart /rBANKTEST



 
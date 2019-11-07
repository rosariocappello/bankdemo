rem @echo off
rem Create Visual COBOL Environment
set entdev=C:\Program Files (x86)\Micro Focus\Enterprise Developer
"%entdev%\bin\cblpromp.exe" >> "setenv.bat"

call "setenv.bat"
rem del /q "%temp%\setenv.bat"
rem check for vista and server 2008 documents folder
set MFSYSCAT=C:\MFETDUSER\BankDemo\System\catalog\catalog.dat
echo Execute mfetdcat /s=%1 /p /f=%2 >> LocalPDS.log
mfetdcat /s=%1 /p /f=%2

rem 
set PDSlst=C:\MFETDUSER\BankDemo\Projects\eclipse\InternalTDProject\My_Applications\Micro_Focus_BankDemo_Project\TaurusPDS.lst

rem Exten file with Suffix
set PDSlstw=C:\MFETDUSER\BankDemo\Projects\eclipse\InternalTDProject\My_Applications\Micro_Focus_BankDemo_Project\TaurusPDSw.lst
del %pdslstw% /q
copy %pdslst% %pdslstw% /y
del %pdslst%
for /f "delims=, tokens=1-7" %%i in (%PDSlstw%) do call :checkSuffix %%i %%j %%k %%l %%m %%n %%o

rem If no PDS Member exist certae message 
if not exist %PDSlst% goto :createMessage
	
goto :eof

:checkSuffix
for /f "delims=. tokens=1-2" %%s in ("%6") do echo %1,%2,%3,%4,%5,%6,%%t,%7 >> %pdslst%

goto :eof

:createMessage
echo Message,PDS is Empty,,,,,,LCATMEM > %PDSlst%
goto :eof
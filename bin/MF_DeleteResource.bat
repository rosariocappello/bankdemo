set rFN=%1
set rFN=%rFN:/=\%

if not exist %rFN% goto :filenotfound

del /q %rFN%

if %errorlevel% NEQ 0 goto :delerror 

echo TAU:OutParm:,File %rFN% deleted,TAU:rc:,00
exit

:delerror
echo TAU:OutParm:,File %rFN% delete error %errorlevel%,TAU:rc:,08
exit

:filenotfound
echo TAU:OutParm:,File %rFN% not found,TAU:rc:,08
exit
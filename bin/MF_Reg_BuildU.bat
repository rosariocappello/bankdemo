if NOT DEFINED %ESDEMO_BASE% call mf_set_base

call mf_set_ip

set BANKLEVEL=%1
set BANKREG=%2
set BUILDTYPE=%3

Echo Building Region %BANKREG% in Level %BANKLEVEL%

Echo Then building deltas from Test.

@rem copy %ESDEMO_BASE%\BANKBASE\Sync\BANKPROD-LBUILD.dat %ESDEMO_BASE%\BANKBASE\Sync\%BANKLEVEL%-LBUILD.dat

Call %ESDEMO_BASE%\BANKBASE\Procedures\autobuild %BANKLEVEL% %BANKLEVEL% %BANKREG% %BUILDTYPE%

:COPY

if %BASEIPADDR%==127.0.0.1 GOTO END

if %BANKLEVEL%==BANKDEV GOTO END

net use s: \\%BASEIPADDR%\ESDemo_Base %ESDEMO_PASSWORD% /USER:%ESDEMO_USER%

s:

cd %BANKLEVEL%\%BANKREG%\system\loadlib

copy %ESDEMO_BASE%\%BANKLEVEL%\%BANKREG%\system\Loadlib\*.*

rem 10 second  before disconnecting drive

ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null


net use s: /d /y


:END

Echo Build for Region %BANKREG% is complete.

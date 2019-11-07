call mf_set_base
call mf_set_ip

rem Set Environment
echo on

set BANKLEVEL=%1
set Template_Region=%2
set New_Region=%3
set New_Region_Port_Number=%4
 
rem mfds -x 5 c:\mfetsuser\%New_Region%\system %Template_Region%

echo Region details exported from %Template_Region% ...... Complete>> %New_Region%.out
echo. >> %New_Region%.out
echo. >> %New_Region%.out

call %ESDEMO_BASE%\BANKBASE\Procedures\batchsubstitute xxESDEMO %ESDEMO_BASE% %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%Template_Region%.xml>%ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\temp.xml

rem ******************************************************************************************
rem   2014/01/21 rgl change 2 
rem   added execution of batchsubstitute between original two to look for all occurrences of 
rem   "BankDemo" and change to new region name in XML file so new region could start without 
rem   shutting source region down
rem   Also changed original second execution to read tempa.xml instead of temp.xml
rem ****************************************************************************************

call %ESDEMO_BASE%\BANKBASE\Procedures\batchsubstitute xxBANKREG %New_Region% %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\temp.xml>%ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\tempa.xml
call %ESDEMO_BASE%\BANKBASE\Procedures\batchsubstitute xxBANKLEVEL %BANKLEVEL% %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\tempa.xml>%ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\tempb.xml

call %ESDEMO_BASE%\BANKBASE\Procedures\batchsubstitute 5555 %New_Region_Port_Number% %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\tempb.xml>%ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%New_Region%.xml

rem *************************************************************************************
rem    end of rgl change 2
rem *************************************************************************************

echo XML file updated for %New_Region% ...... Complete >> %New_Region%.out
echo. >> %New_Region%.out

if  %BANKLEVEL%==BANKDEV set BASEIPADDR=127.0.0.1

if  %BASEIPADDR%==127.0.0.1 GOTO MFDS-IMPORT

net use i: \\%BASEIPADDR%\ESDemo_Base %ESDEMO_PASSWORD% /USER:%ESDEMO_USER%

copy %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%New_Region%.xml i:\BANKBASE\Templates\%BANKLEVEL%\%New_Region%.xml


rem 10 second  before disconnecting drive

ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null
ping 127.0.0.1  >null

net use i: /d /y


:MFDS-IMPORT
set CCITCP2=%BASEIPADDR%
set CCITCP2_PORT=86

mfds -g 5 %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%New_Region%.xml O

rem del %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\temp.xml
rem del %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\tempa.xml
rem del %ESDEMO_BASE%\BANKBASE\Templates\%BANKLEVEL%\%new_region%.xml

echo Region details imported for %New_Region%  ...... Complete>> %New_Region%.out
echo. >> %New_Region%.out

REM casstart /r%New_Region%

echo Region %New_Region% started ...... Complete >> %New_Region%.out
echo. >> %New_Region%.out

REM casstop /ls%New_Region% /w30

echo Region Close Process completed with RC 00 >> %NeSSSw_Region%.out

type  %New_Region%.out

echo end  MF_JK_importregion.bat

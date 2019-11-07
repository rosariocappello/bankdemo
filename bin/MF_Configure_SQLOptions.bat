:: Start SQL Client Options tool for a specific XDB.INI file.
::-----------------------------------------------------------------------
:: Change activities:
::
:: input parm : target database (Local|Host)
::              <zConnect_installation>
::              
:: output parm: -
:: output dsn : -
:: COPYRIGHT Micro Focus 2014
echo off
set target=%1
set TD_Procedures=%2

xopt40n /i%TD_Procedures%\Configuration\xdb-%target%.ini

echo ReturnCode: 4

exit

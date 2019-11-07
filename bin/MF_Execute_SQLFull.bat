:: SQL Execution using SQL Option local or with XDB Link against mainframe.
:: Modify the SQL member to produce a SQL result file.
:: Execute SQL statement in specified member against a selected database.
:: The target database is selected in a previous zConnect dialog.
::-----------------------------------------------------------------------
:: Change activities:
::
:: input parm : target database (Local|Host)
::              path/name of member with SQL statement
::              path/name of result file
::              path of zConnect installation
::              
:: output parm: -
:: output dsn : local file with SQL results
:: COPYRIGHT Micro Focus 2014
echo off
set target=%1
set SQLMember=%2
set fpath=%~dp2%
set fn=%~n2%
set results=%3
set TD_Procedures=%4

del /Q %results%
echo --** SQL Statements **-- > %results%
type %SQLMember% >> %results%
echo. >>  %results%
echo --**     Results    **-- >> %results%
type %SQLMember% > %fpath%\%fn%_%target%.sql
echo. >> %fpath%\%fn%_%target%.sql
echo DUMP %results%; >> %fpath%\%fn%_%target%.sql

if %target%x == Localx xwiz40n /i%TD_Procedures%\Configuration\xdb-Local.ini %fpath%\%fn%_%target%.sql
if %target%x == Hostx xwiz40n /i%TD_Procedures%\Configuration\xdb-Host.ini %fpath%\%fn%_%target%.sql

echo ReturnCode: 4
echo OutParm: %results% 

exit

:: Use DIR to create the element list for SQL Execution result files.
::-----------------------------------------------------------------------
:: Change activities:
::
:: input parm : <zConnect_workspace>\SQLWork
::              Generic name *<sql_member_name>*.out 
::              
:: output parm: -
:: output dsn : List of result files matching member name
:: COPYRIGHT Micro Focus 2014

echo off
:: Retrieve SPUFI Output files for given Spufi Member
set fpath=%1
set fname=%2

set results=%fpath%\RetrieveResults.txt
del /q %results%
dir /b %fpath%\%fname% > %results%
echo ReturnCode: 4
echo OutParm: %fpath%\RetrieveResults.txt
exit
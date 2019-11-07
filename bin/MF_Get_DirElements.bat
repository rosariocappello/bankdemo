:: Read Output file per SQL member for Get Children action in Tree View
::-----------------------------------------------------------------------
:: Change activities:
::
:: input parm : file path to search in
::              file name to search for (can have wild cards)
:: output parm: -
:: output dsn : results file with SQL output file names
::              local file
:: COPYRIGHT Micro Focus 2014
echo off

set fpath=%1
set fname=%2
set dirout=%fpath%\OutDir.txt
set results=%fpath%\OutResults.txt
set results01=%fpath%\OutResults01.txt
del /q %results%
del /q %results01%
forfiles /P %fpath% /M %fname% /C "cmd /C echo @file,@path,@fdate,@ftime,OUT,LISTING,SQLOUT>> %results01%"
for /f "tokens=1-7 delims=," %%i in (%results01%) do echo %%~i,%%~j,%%k,%%l,%%m,%%n,%%o>> %results%
if not exist %results% echo No Output available,,,,,,SQLOUT> %results% 
echo ReturnCode: 4
echo OutParm: %results%
exit
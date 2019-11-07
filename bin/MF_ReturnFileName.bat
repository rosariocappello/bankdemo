:: Convert file name into a AWM File Descriptor property.
::-----------------------------------------------------------------------
:: Change activities:
::
:: input parm : Physical file name
::              
:: output parm: File Descriptor property
:: output dsn : -
:: COPYRIGHT Micro Focus 2014

echo off
:: Return File Name to Output Dialog
set fname=%1
echo ReturnCode: 4
echo OutParm: %fname% 
exit

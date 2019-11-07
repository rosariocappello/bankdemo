echo %1 >> MF_GetAllProperties.log
set fName=%~n1
set fExt=%~x1
set fExt=%fExt:~1%
echo %fExt%
if %fExt%x==x goto :undefined

* Valid COBOL extensions
if /i %fExt%==CBL goto :COBOL
if /i %fExt%==COB goto :COBOL
* Valid COPY extensions
if /i %fExt%==CPY goto :COPY
* Valid BMS extensions
if /i %fExt%==BMS goto :BMS
* Valid MFS extensions
if /i %fExt%==MFS goto :MFS
* Valid PSB extensions
if /i %fExt%==PSB goto :PSB
* Valid DBD extensions
if /i %fExt%==DBD goto :DBD
* Valid Data File extensions
if /i %fExt%==DAT goto :DATA
* Valid JCL extensions
if /i %fExt%==JCL goto :JCL
* Valid PRC extensions
if /i %fExt%==PRC goto :PROCLIB
* Valid ASM extensions
if /i %fExt%==ASM goto :ASSEMBLER
if /i %fExt%==MLC goto :ASSEMBLER
* Valid MAC extensions
if /i %fExt%==MAC goto :MACRO
* Valid PLI extensions
if /i %fExt%==PLI goto :PLI
* Valid INCLUDE extensions
if /i %fExt%==INC goto :INCLUDE
* Valid INCLUDE extensions
if /i %fExt%==DIR goto :DIRECTIVES
* Non Valid extensions
echo TAU:OutParm: %fExt% UNDEFINED
echo TAU:rc: 00
exit

:COBOL
echo TAU:OutParm: %fExt% COBOL %fName%
echo TAU:rc: 00
exit

:COPY
echo TAU:OutParm: %fExt% COPYBOOK %fName%
echo TAU:rc: 00
exit

:BMS
echo TAU:OutParm: %fExt% BMS %fName%
echo TAU:rc: 00
exit

:MFS
echo TAU:OutParm: %fExt% MFS %fName%
echo TAU:rc: 00
exit

:PSB
echo TAU:OutParm: %fExt% PSB %fName%
echo TAU:rc: 00
exit

:DBD
echo TAU:OutParm: %fExt% DBD %fName%
echo TAU:rc: 00
exit

:DATA
echo TAU:OutParm: %fExt% DATAFILE %fName%
echo TAU:rc: 00
exit

:JCL
echo TAU:OutParm: %fExt% JCL %fName%
echo TAU:rc: 00
exit

:PROCLIB
echo TAU:OutParm: %fExt% PROCLIB %fName%
echo TAU:rc: 00
exit

:ASSEMBLER
echo TAU:OutParm: %fExt% ASSEMBLER %fName%
echo TAU:rc: 00
exit

:MACRO
echo TAU:OutParm: %fExt% MACRO %fName%
echo TAU:rc: 00
exit

:PLI
echo TAU:OutParm: %fExt% PLI %fName%
echo TAU:rc: 00
exit

:INCLUDE
echo TAU:OutParm: %fExt% INCLUDE %fName%
echo TAU:rc: 00
exit

:DIRECTIVES
echo TAU:OutParm: %fExt% DIRECTIVES %fName%
echo TAU:rc: 00
exit

:undefined
echo TAU:OutParm: NONE UNDEFINED %fName%
echo TAU:rc: 00
exit
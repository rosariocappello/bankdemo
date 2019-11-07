ECHO ON

SET PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin;%path%

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\BMS\BMS.cblproj

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\Bank_prod\Bank_cics.cblproj

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\cics_util\cics_util.cblproJ

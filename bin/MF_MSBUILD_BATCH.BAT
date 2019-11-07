ECHO ON

SET PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin;%path%

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\BATCH\BATCH.cblproj

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\UTIL\UTIL.cblproj

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\TOOLS\TOOLS.cblproj
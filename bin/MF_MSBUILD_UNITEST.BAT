ECHO ON

SET PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin;%path%

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\CALLOAN\CALLOAN.cblproj

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\TestCALLOAN\TestCALLOAN.cblproj

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\TestCALLOAN1\TestCALLOAN1.cblproj

msbuild C:\bankdemo\vcprojs\banks\prod\Bank_prod\TestCALLOAN2\TestCALLOAN2.cblproj

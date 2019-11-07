echo on


del /q "%temp%"\*.*


Set ESDEMO_BASE=c:\microfocus\esd
set path=%JAVA_HOME%\bin;%ESDEMO_BASE%\BANKBASE\Procedures;%ESDEMO_BASE%\BANKBASE\MFAB\Bin;%path%

call mf_set_base
call mf_set_ip

if exist %temp%\setenv.bat  del /q %temp%\setenv.bat

"C:\Program Files (x86)\Micro Focus\Enterprise Developer\bin\cblpromp.exe"   >> "%temp%\setenv.bat"

call "%temp%\setenv.bat"
del /q "%temp%\setenv.bat"

set JENKINS_HOME=%ESDEMO_BASE%\BANKBASE\Jenkins_Home
set JENKINS_USER=mfuser
set ACCUREV_HOME=%JENKINS_HOME%
set JAVA_HOME=C:\Program Files\Java\jre1.8.0_161
SET CLASSPATH=%JAVA_HOME%\LIB;%classpath%
set ANT_HOME=C:\apache-ant-1.9.2
set debug_Config=C:\microfocus\esd\BANKBASE\debugConfig\debugconfig.xml

accurev login -n mfuser mfuser


"%JAVA_HOME%\bin\java.exe" -jar "%ESDEMO_BASE%\BANKBASE\Jenkins\Jenkins.war" --httpPort=8081

pause

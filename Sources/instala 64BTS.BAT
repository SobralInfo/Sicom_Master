:Win64
ECHO *** Copiando as DLLs x64 ***
if NOT EXIST %windir%\SysWOW64\libxml2.dll copy libxml2.dll %windir%\SysWOW64
ECHO *** Registrando as DLLs x64 ***
regsvr32 %windir%\SysWOW64\libxml2.dll /s
goto end

:end

pause

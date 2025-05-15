:Win64
ECHO *** Copiando as DLLs x64 ***
if NOT EXIST %windir%\SysWOW64\capicom.dll copy capicom.dll %windir%\SysWOW64
if NOT EXIST %windir%\SysWOW64\msxml5.dll  copy msxml5.dll  %windir%\SysWOW64
if NOT EXIST %windir%\SysWOW64\msxml5r.dll copy msxml5r.dll %windir%\SysWOW64
if NOT EXIST %windir%\SysWOW64\midas.dll copy midas.dll %windir%\SysWOW64
if NOT EXIST %windir%\System32\capicom.dll copy capicom.dll %windir%\SysWOW64
if NOT EXIST %windir%\System32\msxml5.dll  copy msxml5.dll  %windir%\SysWOW64
if NOT EXIST %windir%\System32\msxml5r.dll copy msxml5r.dll %windir%\SysWOW64
if NOT EXIST %windir%\System32\midas.dll copy midas.dll %windir%\SysWOW64
ECHO *** Registrando as DLLs x64 ***
regsvr32 %windir%\SysWOW64\capicom.dll /s
regsvr32 %windir%\SysWOW64\msxml5.dll /s
regsvr32 %windir%\SysWOW64\msxml5r.dll /s
regsvr32 %windir%\SysWOW64\midas.dll /s
regsvr32 %windir%\System32\capicom.dll /s
regsvr32 %windir%\System32\msxml5.dll /s
regsvr32 %windir%\System32\msxml5r.dll /s
regsvr32 %windir%\System32\midas.dll /s
goto end

:end

pause

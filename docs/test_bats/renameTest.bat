@ECHO OFF

set "/Scripts=%APPDATA%\YimMenu\scripts"

goto deleting

echo renaming...

timeout /t 2 /nobreak >nul

:: rename "%/Scripts%\Extras-Addon.lua" "Extras-Addon.lua.new"
rename "%/Scripts%\Extras-Addon.lua" Extras-Addon.lua.old

echo:
echo check it up...

timeout /t 5 /nobreak >nul

:deleting

echo deleting ...
timeout /t 2 /nobreak >nul
del "%/Scripts%\Extras-Addon.lua" >nul 2>&1

echo:
echo check it up...

timeout /t 5 /nobreak >nul
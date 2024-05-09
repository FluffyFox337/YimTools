@ECHO OFF
set "scriptFolder=%~dp0"
set "/Downloads=%USERPROFILE%\Downloads"

:qest_YN

cls
set /p yn=Do you wanna start Xenos64? (Y/N): 
if /i "%yn%"=="Y" (
        goto Yes
    ) else (
		cls
        echo "Test words"
        timeout /t 3 /nobreak >nul
        goto No
	)
	
:Yes

echo Yes
start "" %/Downloads%\Xenos64.exe
timeout /t 3 /nobreak >nul
goto qest_YN

:No

echo No

timeout /t 3 /nobreak >nul
goto qest_YN
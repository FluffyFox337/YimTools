@ECHO OFF

:: Set environment variables for source and destination paths
   :: in script needed "/" back to %link% . %link%/root 
set "scriptFolder=%~dp0"
set "/YimMenu=%APPDATA%\YimMenu"
set "/Scripts=%APPDATA%\YimMenu\scripts"
set "/Downloads=%USERPROFILE%\Downloads"

:: If Downloads folder does not exist default to onedrive desktop
if not exist "%/Downloads%" (
    set "/Downloads=%USERPROFILE%\OneDrive\Desktop" )
:: If Onedrive destination does not exist, default to normal Desktop
if not exist "%/Downloads%" (
    set "/Downloads=%USERPROFILE%\Desktop" )

:: Set Download URL links for choiced items 

set "Xenos64Url=https://raw.githubusercontent.com/FluffyFox337/UpdateBAT/main/Xenos64.exe"
set "FateInjectorUrl=https://github.com/fligger/FateInjector/releases/download/1.0/FateInjector.exe"

set "YimMenuUrl=https://github.com/FluffyFox337/YimMenu_Actual/raw/master/RELEASE/YimMenu.dll"

set "Extras-AddonUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-Addon.lua"
set "Extras-DataUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-data.lua"
set "Extras-JsonUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/json.lua"

:: needed fix link to download ultimate menu (error 404 )
set "UltimateMenuUrl=https://raw.githubusercontent.com/L7NEG/Ultimate-Menu/main/YimMenu/Ultimate_Menu%20For%20YimMenu%20V2.1%201.68.lua"

set "XML_mapsUrl=https://mega.nz/folder/BnM2jQoT#Lb6MG4m24nGv0GkNGsD3sQ"
set "animDictsCompactUrl=https://raw.githubusercontent.com/DurtyFree/gta-v-data-dumps/master/animDictsCompact.json"

:: Skip update
:: goto menu

:: Set update script link
set "updateScriptUrl=https://raw.githubusercontent.com/FluffyFox337/UpdateBAT/main/YimTools_TEST.bat"
set "exeupdateUrl=https://raw.githubusercontent.com/FluffyFox337/UpdateBAT/main/YimTools_alfa.exe"

:: Paste something for trig update ->> test renaming folders


:: Check for updates
echo Checking Repository for updates to YimTools_TEST.bat...
powershell -command "& { Invoke-WebRequest -Uri '%updateScriptUrl%' -OutFile '%scriptFolder%YimTools_TESTauto.bat.new' }"

:: Compare the current script with the updated version
fc "%scriptFolder%YimTools_TESTauto.bat.new" "%scriptFolder%YimTools_TESTauto.bat" >nul
if errorlevel 1 (
    echo Update found! Updating your YimTools_TESTauto.bat to the latest version...
    move /y "%scriptFolder%YimTools_TESTauto.bat.new" "%scriptFolder%YimTools_TESTauto.bat" >nul
	cls
    echo Script updated successfully!
    timeout /t 1 /nobreak >nul
    goto restart
 
) else (
    echo No updates found.
    del "%scriptFolder%YimTools_TESTauto.bat.new" >nul
    echo "Returning to the main menu."
    timeout /t 1 /nobreak >nul
    goto menu
)

:download_exe_yimtools

echo Download YimTools_alfa.exe...
powershell -command "& { Invoke-WebRequest -Uri '%exeupdateUrl%' -OutFile '%scriptFolder%YimTools_alfa.exe.new' }"

:: Compare the current script with the updated version
fc "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
if errorlevel 1 (
    echo Update found! Updating your YimTools_alfa.exe to the latest version...
    move /y "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
	cls
    echo Script updated successfully!
    timeout /t 1 /nobreak >nul
    goto exestart
	
:: Continue with the main script

:menu

cls
echo "  ______   ______   ______   ______   ______   ______   ______ "
echo " /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/ "
echo "                                                               "
echo "                    YimTools bat edition                       "
echo "                                                               "
echo "                  Script Version: TEST                         "
echo "  ______   ______   ______   ______   ______   ______   ______ "
echo " /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/ "


echo ------------------------------------------------------------------
echo   This app is for easily Downloading/Updating YimMenu/Addons
echo 	  and tools you may want/need for YimMenu itself.
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo 			Main Menu
echo ------------------------------------------------------------------
echo Choose an option:
echo 1. Download Injector (To Downloads or Desktop)
echo 2. Download YimMenu (To Downloads or Desktop)
echo 3. Download Addons (To YimMenu\scripts)
echo 4. Delete YimMenu Cache Folder (Quick fix when GTA updates)
echo 5. Optional Downloads
echo 6. Instruction to install/use YimMenu
echo 7. Exit the application
echo 8. Download new EXE edition YimTools

echo ------------------------------------------------------------------
echo If your downloads folder is not in the proper location on your
echo harddrive, the downloads will default to your desktop, instead.

choice /c 12345678 /n
 if errorlevel 7 goto download_exe_yimtools
 if errorlevel 7 goto goodbye
 if errorlevel 6 goto instructions
 if errorlevel 5 goto optional_downloads
 if errorlevel 4 goto delete_cache_folder
 if errorlevel 3 goto download_addons
 if errorlevel 2 goto download_yimmenu
 if errorlevel 1 goto download_injectors

:instructions

cls
echo ------------------------------------------------------------------
echo 		How to Install/Use YimMenu
echo ------------------------------------------------------------------
echo "1. Start GTA 5 on your PC"
echo "2. Open your preferred injector, and find/select YimMenu.dll"
echo "3. Select the process (gta5.exe) to inject YimMenu into"
echo "4. Once YimMenu is injected open GTA and you should see the menu"
echo "If this is your first time using YimMenu, press Update Cache"
echo "Press the Insert key to open/close the menu"
echo "Go to Settings > GUI and uncheck Show Overlay to show/hide Yim"
timeout /t 10 /nobreak >nul
echo "Exiting to the main menu in 10 seconds."
timeout /t 10 /nobreak >nul
cls
goto menu

:download_injectors

cls
echo ------------------------------------------------------------------
echo 	Download injectors
echo ------------------------------------------------------------------
echo Choose Injector:
echo 1. Xenos
echo 2. Fate_Injector
echo 3. Back to Main Menu
echo ------------------------------------------------------------------
echo More injectors may be added in the future!

choice /c 1234 /n
if errorlevel 3 goto menu
if errorlevel 2 goto download_fate_injector
if errorlevel 1 goto download_xenos

:check_yimmenu_E

cls
set /p yn=Have you downloaded/used YimMenu before? (Y/N): 
if /i "%yn%"=="Y" (
        goto download_extras_addon
    ) else (
		cls
        echo "Please download and use YimMenu first before installing the Extras Addon."
        echo "After using YimMenu, you can come back and install the Extras Addon."
        echo "to use YimMenu, download an injector like FateInjector, Xenos or ProcessHacker2."
		echo ------------------------------------------------------------------
		echo "When running YimMenu for the first time, click Update Cache and load into story mode or online."
		echo "If you don't know how to use YimMenu, press 6 on the main menu for instructions"
		echo ------------------------------------------------------------------
		echo "Returning to the main menu in 15 seconds."
        timeout /t 15 /nobreak >nul
        cls
        goto menu
	)
	
:check_yimmenu_U

set /p yn=Have you downloaded/used YimMenu before? (Y/N): 
if /i "%yn%"=="Y" (
        goto download_ultimate_menu
    ) else (
		cls
        echo "Please download and use YimMenu first before installing the UltimateMenu."
        echo "After using YimMenu, you can come back and install the UltimateMenu."
        echo "to use YimMenu, download an injector like FateInjector, Xenos or ProcessHacker2."
		echo ------------------------------------------------------------------
		echo "When running YimMenu for the first time, click Update Cache and load into story mode or online."
		echo "If you don't know how to use YimMenu, press 6 on the main menu for instructions"
		echo ------------------------------------------------------------------
		echo "Returning to the main menu in 15 seconds."
		timeout /t 15 /nobreak >nul
		cls
		goto menu
    )

:delete_cache_folder

echo "Deleting YimMenu's cache folder, this is ONLY necessary if you've updated YimMenu.dll and you're still crashing."
echo "If this does not fix the issue, check their github issues page at https://github.com/YimMenu/YimMenu/issues"
rmdir /s /q "%/YimMenu%\cache"
cls
echo "Cache folder deleted successfully."
echo "Returning to main menu in 10 seconds."
timeout /t 10 /nobreak >nul
goto menu

:download_extras_addon

cls
echo ------------------------------------------------------------------
echo 	Downloading Extras Addon from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of Extras Addon"
del "%/Scripts%\Extras-Addon.lua" >nul 2>&1

echo "Downloading new version of Extras-Addon.lua from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%Extras-AddonUrl%' -OutFile '%/Scripts%\Extras-Addon.lua' }"
	powershell -command "& { Invoke-WebRequest -Uri '%Extras-JsonUrl%' -OutFile '%/Scripts%\json.lua' }"
	powershell -command "& { Invoke-WebRequest -Uri '%Extras-DataUrl%' -OutFile '%/Scripts%\Extras-data.lua' }"

if not exist "%/Scripts%\Extras-Addon.lua" (
		echo "Error: Failed to download Addon. Check the internet connection or the source URL."
	) else if not exist "%/Scripts%\json.lua" (
		echo "Error: Failed to download Json. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Extras Addon downloaded successfully. File Location: %/Scripts%\Extras-Addon.lua"
		echo "Json downloaded successfully. (Required json config file) File Location: %/Scripts%\json.lua"
		echo "Extras-data downloaded successfully. (Required, stores objects, vehicles, etc.) File Location: %/Scripts%\json.lua"
		echo "Returning to the main menu in 10 seconds."
	)
timeout /t 10 /nobreak >nul
cls
goto menu
	
:download_ultimate_menu
cls
echo ------------------------------------------------------------------
echo 	Downloading UltimateMenu.lua from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of Extras Addon"
del "%/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua" >nul 2>&1

echo "Downloading new version of Ultimate_Menu.lua from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenuUrl%' -OutFile '%/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua' } "

if not exist "%/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua" (
		echo "Error: Failed to download Addon. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Ultimate_Menu downloaded successfully. File Location: %/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua"
	)
timeout /t 10 /nobreak >nul
cls
goto menu	
	
:download_yimmenu
cls
echo ------------------------------------------------------------------
echo 	Downloading YimMenu from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of YimMenu"
del "%/Downloads%\YimMenu.dll" >nul 2>&1

echo "Downloading new version of YimMenu.dll from the repository..."

    powershell -command "& { Invoke-WebRequest -Uri '%YimMenuUrl%' -OutFile '%/Downloads%\YimMenu_3179.dll' }"

if not exist "%/Downloads%\YimMenu_3179.dll" (
    echo "Error: Failed to download YimMenu. Check the internet connection or the source URL."
) else (
    cls
    echo "YimMenu downloaded successfully. File Location: %/Downloads%\YimMenu_3179.dll"
    echo "Returning to the main menu in 3 seconds."
)
timeout /t 3 /nobreak >nul
cls
goto menu



:download_fate_injector
cls
echo ------------------------------------------------------------------
echo 	Downloading FateInjector from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of FateInjector"
if exist "%/Downloads%\FateInjector.exe" (
    echo "Found FateInjector, You do not need to download this again."
) else (
    echo "No existing application was found."
)

echo "Downloading FateInjector from the repository..."

    powershell -command "& { Invoke-WebRequest -Uri '%FateInjectorUrl%' -OutFile '%/Downloads%\FateInjector.exe' }"

if not exist "%/Downloads%\FateInjector.exe" (
    echo "Error: Failed to download FateInjector. Check the internet connection or the source URL."
) else (
    cls
    echo "FateInjector downloaded successfully. File Location: %/Downloads%\FateInjector.exe"
    echo "Returning to the main menu in 3 seconds."
)
timeout /t 3 /nobreak >nul
cls
goto menu

:download_xenos
cls
echo ------------------------------------------------------------------
echo 	Downloading Xenos64 from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of Xenos"
if exist "%/Downloads%\Xenos64.exe" (
    echo "Found Xenos64, You do not need to download this again."
) else (
    echo "No existing application was found."
)

echo "Downloading Xenos64 from the repository..." 

    powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\Xenos64.exe' }"

if not exist "%/Downloads%\Xenos64.exe" (
    echo "Error: Failed to download Xenox64 injector. Check the internet connection or the source URL."
) else (
    cls
    echo "Xenos64 Injector downloaded successfully. File Location: %/Downloads%\Xenos64.exe"
    echo "Returning to the main menu in 3 seconds."
)
timeout /t 3 /nobreak >nul
cls
goto menu

:download_addons
cls
echo ------------------------------------------------------------------
echo 	Download addons (to /scripts)
echo ------------------------------------------------------------------
echo Choose addon:
echo 1. Extras-Addon
echo 2. Ultimate-Menu
echo 3. Back to Main Menu
echo ------------------------------------------------------------------
echo More injectors may be added in the future!

choice /c 1234 /n
if errorlevel 3 goto menu
if errorlevel 2 goto check_yimmenu_U
if errorlevel 1 goto check_yimmenu_E


:optional_downloads
cls
echo ------------------------------------------------------------------
echo 	Optional Downloads
echo ------------------------------------------------------------------
echo Choose an option:
echo 1. Get XML Maps/Vehicles (Opens in Browser)
echo 2. Download Animations Dictionary (To YimMenu Root Folder)
echo 3. Back to Main Menu
echo ------------------------------------------------------------------
echo More optional downloads may be added in the future!

choice /c 1234 /n
if errorlevel 3 goto menu
if errorlevel 2 goto download_animDictsCompact
if errorlevel 1 goto download_XML_Maps

:download_XML_Maps
echo Opening MagicModz89's MEGA drive in a browser window...
start "XML Maps" "%XML_mapsUrl%"
:: cscript //nologo BringToFront.vbs
echo To use these, download the file as zip and extract the corresponding contents to %/YimMenu%\xml_maps and xml_vehicles
echo Returning to Optional Downloads Menu
timeout /t 5 /nobreak >nul
goto optional_downloads

:download_animDictsCompact
cls
echo ------------------------------------------------------------------
echo 	Downloading Animations Dictionary from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of animDictsCompact.json"
del "%/YimMenu%/animDictsCompact.json" >nul 2>&1

echo "Downloading new version of animDictsCompact.json from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/animDictsCompact.json' }"

if not exist "%/YimMenu%/animDictsCompact.json" (
		echo "Error: Failed to download Animations. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Extras Addon downloaded successfully. File Location: %/YimMenu%/animDictsCompact.json"
		echo "Returning to the main menu in 5 seconds."
	)
timeout /t 5 /nobreak >nul
cls
goto optional_downloads


:restart
echo "restarting new bat file. Exit..."
timeout /t 2 /nobreak >nul
start YimTools_TESTauto.bat
exit

:goodbye
echo "Thank you for using Extras Addon!  Brought to you by DeadlineEm, USBMenus & KAOS Incorporated"
echo "Exiting in 3 seconds."
timeout /t 3 /nobreak >nul
exit

:exit
echo Exiting...
exit /b

:exestart 
echo "starting new EXE edition. Exit..."
timeout /t 2 /nobreak >nul
start YimTools_alfa.exe
exit

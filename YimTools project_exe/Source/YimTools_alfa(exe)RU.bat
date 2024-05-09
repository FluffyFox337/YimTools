@ECHO OFF
:: ==== File info ====
:: encoding OEM866 
:: syntaxis Batch
:: ===================


:: Set environment variables for source and destination paths
  :: in the code, do not forget the "\" symbol after the %link%
  ::  to set %link% if you need to operate with the root section of the link. 
  ::  Sample: set "link=C\data"   -OutFile '%link%\file.txt'  >> C\data\file.txt
  ::                              -OutFile '%link%file.txt'   >> C\file.txt
  

echo ///////// Script Version: alfa 0.0.0.3  //////////  
timeout /t 2 /nobreak >nul

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
	
:: Set update script/exe link
:: set "updateScriptUrl=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"
set "updateScriptUrl=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"


:: Set Download URL links for choiced items 

set "Xenos64Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Xenos64.exe"
set "FateInjectorUrl=https://github.com/fligger/FateInjector/releases/download/1.0/FateInjector.exe"

set "YimMenuUrl=https://github.com/FluffyFox337/YimMenu_Actual/raw/master/RELEASE/YimMenu.dll"

set "settingsUrl=https://github.com/FluffyFox337/YimTools/raw/main/items/settings.json"

set "Extras-AddonUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-Addon.lua"
set "Extras-DataUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-data.lua"
set "Extras-JsonUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/json.lua"

:: needed fix link to download ultimate menu from original repository (error 404 )
::set "UltimateMenuUrl2=https://raw.githubusercontent.com/L7NEG/Ultimate-Menu/main/YimMenu/Ultimate_Menu%20For%20YimMenu%20V2.1%201.68.lua"
set "UltimateMenuUrl=https://github.com/FluffyFox337/YimTools/raw/main/items/Ultimate_Menu_YimMenu-V2.1-1.68.lua"

set "XML_mapsUrl=https://mega.nz/folder/BnM2jQoT#Lb6MG4m24nGv0GkNGsD3sQ"
set "animDictsCompactUrl=https://raw.githubusercontent.com/DurtyFree/gta-v-data-dumps/master/animDictsCompact.json"
set "https://raw.githubusercontent.com/FluffyFox337/YimTools/main/items/instructions_Xenos.txt"


:languageQUEST
cls
echo ------------------------------------------------------------------
echo 	Choice language  / ‚ë¡¥à¨â¥ ï§ëª 
echo ------------------------------------------------------------------
echo 1. English
echo 2. ãááª¨©
echo ------------------------------------------------------------------

choice /c 12 /n
 if errorlevel 2 goto russianscript
 if errorlevel 1 goto englishscript
 


:englishscript

:: Skip update (for debug&develop)
  goto menu_EN


:: Check for updates
echo Checking Repository for updates to YimTools_alfa.exe...
powershell -command "& { Invoke-WebRequest -Uri '%updateScriptUrl%' -OutFile '%scriptFolder%YimTools_alfa.exe.new' }"

:: Compare the current script with the updated version
fc "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
 if errorlevel 1 (
    echo Update found! Updating your YimTools_alfa.exe to the latest version...
    move /y "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
	cls
    echo Exe updated successfully!
    timeout /t 1 /nobreak >nul
    goto restart_EN
 
) else (
    echo No updates found.
    del "%scriptFolder%YimTools_alfa.exe.new" >nul
    echo "Returning to the main menu."
    timeout /t 1 /nobreak >nul
    goto menu_EN
)


	
:: Continue with the main script

:menu_EN

cls
echo "  ______   ______   ______   ______   ______   ______   ______ "
echo " /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/ "
echo "                                                               "
echo "                    YimTools exe edition                       "
echo "                                                               "
echo "                  Script Version: alfa 0.0.0.3                 "
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

echo ------------------------------------------------------------------
echo If your downloads folder is not in the proper location on your
echo harddrive, the downloads will default to your desktop, instead.

choice /c 1234567 /n
 if errorlevel 7 goto goodbye_EN
 if errorlevel 6 goto instructions_EN
 if errorlevel 5 goto optional_downloads_EN
 if errorlevel 4 goto delete_cache_folder_EN
 if errorlevel 3 goto choice_addons_EN
 if errorlevel 2 goto download_yimmenu_EN
 if errorlevel 1 goto choice_injectors_EN
 


:instructions_EN

cls
echo ------------------------------------------------------------------
echo 		How to Install/Use YimMenu
echo ------------------------------------------------------------------
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 1                   Start GTA 5                      1 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º  Wait until it fully loads into story mode or online.  º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

timeout /t 3 /nobreak >nul
@echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 2           Open your preferred injector             2 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º     and find/select YimMenu.dll file.                  º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

timeout /t 3 /nobreak >nul
@echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 3           Select the process (gta5.exe)            3 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º     inject the cheat by pressing the INJECT button.    º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

timeout /t 3 /nobreak >nul
@echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 4        Once YimMenu is injected open GTA.          4 º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

timeout /t 2 /nobreak >nul
@echo.
echo    ______                                    ______
echo   /_____/ If everything went well, the game /_____/
echo  /_____/ should display the YimMenu window./_____/

timeout /t 2 /nobreak >nul
@echo.
echo -------------------------------------------------------------------
echo -------------------------------------------------------------------
echo  =  Press the INSERT key to open/close the menu.
echo  =  To update the cache, go to the settings and press UPDATE CACHE.
echo  =  Go to Settings - GUI and uncheck Show Overlay to show/hide Yim.

timeout /t 5 /nobreak >nul
@echo.
@echo.
echo ===================================================================
echo  Press 1 to exit to the main menu ...

timeout /t 1 /nobreak >nul

choice /c 1 /n
 if errorlevel 1 goto menu_EN



:choice_injectors_EN

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
 if errorlevel 3 goto menu_EN
 if errorlevel 2 goto download_fate_injector_EN
 if errorlevel 1 goto download_xenos_EN

:check_yimmenu_E_EN

cls
set /p yn=Have you downloaded/used YimMenu before? (Y/N): 
if /i "%yn%"=="Y" (
        goto download_extras_addon_EN
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
        goto menu_EN
	)
	
:check_yimmenu_U_EN

set /p yn=Have you downloaded/used YimMenu before? (Y/N): 
if /i "%yn%"=="Y" (
        goto download_ultimate_menu_EN
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
		goto menu_EN
    )

:delete_cache_folder_EN

echo "Deleting YimMenu's cache folder, this is ONLY necessary if you've updated YimMenu.dll and you're still crashing."
echo "If this does not fix the issue, check their github issues page at https://github.com/YimMenu/YimMenu/issues"
rmdir /s /q "%/YimMenu%\cache"
cls
echo "Cache folder deleted successfully."
echo "Returning to main menu in 10 seconds."
timeout /t 10 /nobreak >nul
goto menu_EN

:download_extras_addon_EN

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
		echo "Extras Addon downloaded successfully."
		echo "File Location: %/Scripts%\Extras-Addon.lua"
		echo "Json downloaded successfully. (Required json config file) "
		echo "File Location: %/Scripts%\json.lua"
		echo "Extras-data downloaded successfully. (Required, stores objects, vehicles, etc.) "
		echo "File Location: %/Scripts%\json.lua"
		echo "Returning to the main menu in 10 seconds."
	)
timeout /t 10 /nobreak >nul
cls
goto menu_EN
	
:download_ultimate_menu_EN
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
		echo "Ultimate_Menu downloaded successfully. "
		echo "File Location: %/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua"
	)
timeout /t 10 /nobreak >nul
cls
goto menu_EN
	
:download_yimmenu_EN
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
    echo "YimMenu downloaded successfully. "
	echo "File Location: %/Downloads%\YimMenu_3179.dll"
    echo "Returning to the main menu in 3 seconds."
)
timeout /t 3 /nobreak >nul
cls
goto menu_EN



:download_fate_injector_EN
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
    echo "FateInjector downloaded successfully. "
	echo "File Location: %/Downloads%\FateInjector.exe"
    echo "Returning to the main menu in 3 seconds."
)
timeout /t 3 /nobreak >nul
cls
goto menu_EN

:download_xenos_EN

cls
echo ------------------------------------------------------------------
echo 	Downloading Xenos64 from the repository 
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of Xenos"

if exist "%/Downloads%\Xenos64.exe" (
cls
echo " Found Xenos64, You do not need to download this again. "
goto quest_start_Xenos_EN
) else (
  echo "Downloading Xenos64 from the repository..."
  powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\Xenos64.exe' }"
  if not exist "%/Downloads%\Xenos64.exe" (
  echo "Error: Failed to download Xenox64 injector. Check the internet connection or the source URL." 
  ) else (
    cls
    echo "Xenos64 Injector downloaded successfully. "
    @echo.
    echo "File Location: %/Downloads%\Xenos64.exe"
    timeout /t 1 /nobreak >nul
    goto quest_start_Xenos_EN )
)

:quest_start_Xenos_EN
cls
set /p yn=Do you wanna start Xenos64? (Y/N): 
if /i "%yn%"=="y" (
goto start_Xenos_EN
) else (
cls
echo "Exit to the main menu..."
timeout /t 1 /nobreak >nul
cls
goto menu_EN )


:choice_addons_EN
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
 if errorlevel 3 goto menu_EN
 if errorlevel 2 goto check_yimmenu_U_EN
 if errorlevel 1 goto check_yimmenu_E_EN


:optional_downloads_EN
cls
echo ------------------------------------------------------------------
echo 	Optional Downloads
echo ------------------------------------------------------------------
echo Choose an option:
echo 1. Get XML Maps/Vehicles (Opens in Browser)
echo 2. Download Animations Dictionary (To YimMenu Root Folder)
echo 3. Import YimMenu's settings ( my settings, maybe you like that )
echo 4. Back to Main Menu
echo ------------------------------------------------------------------
echo More optional downloads may be added in the future!

choice /c 1234 /n
 if errorlevel 4 goto menu_EN
 if errorlevel 3 goto import_settings_EN
 if errorlevel 2 goto download_animDictsCompact_EN
 if errorlevel 1 goto download_XML_Maps_EN

:download_XML_Maps_EN
echo Opening MagicModz89's MEGA drive in a browser window...
start "XML Maps" "%XML_mapsUrl%"

:: cscript //nologo BringToFront.vbs

echo To use these, download the file as zip and extract the corresponding contents to %/YimMenu%\xml_maps and xml_vehicles
echo Returning to Optional Downloads Menu
timeout /t 5 /nobreak >nul
goto optional_downloads_EN

:download_animDictsCompact_EN
cls
echo ------------------------------------------------------------------
echo 	Downloading Animations Dictionary from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of animDictsCompact.json"
del "%/YimMenu%\animDictsCompact.json" >nul 2>&1

echo "Downloading new version of animDictsCompact.json from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/animDictsCompact.json' }"

if not exist "%/YimMenu%/animDictsCompact.json" (
		echo "Error: Failed to download Animations. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Extras Addon downloaded successfully. "
		echo "File Location: %/YimMenu%/animDictsCompact.json"
		echo "Returning to the main menu in 5 seconds."
	)
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_EN

:import_settings_EN

cls
echo ------------------------------------------------------------------
echo 	Downloading settings.json to the YimMenu repository
echo ------------------------------------------------------------------
echo "Deleting old settings.json"
del "%/YimMenu%\animDictsCompact.json" >nul 2>&1

echo "Downloading new version of custom settings.json from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%settingsUrl%' -OutFile '%/YimMenu%/settings.json' }"

if not exist "%/YimMenu%/settings.json" (
		echo "Error: Failed to download settings. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Settings downloaded successfully. "
		echo "File Location: %/YimMenu%/settigs.json"
		echo "Returning to the main menu in 5 seconds."
	)
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_EN

:: //////////////////////////////////////////////////////////////////////
:: \\\\\\\\\\\\\ \\\\\\\\\\\ astions links EN \\\\\\\\\\\\\\\\\\\\\\\\\
:: /////////////////////////////////////////////////////////////////////

:start_Xenos_EN

cls
echo Starting injector Xenos ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\Xenos64.exe
:: start Xenos64.exe
exit

:restart_EN
echo "restarting new exe file. Exit..."
timeout /t 2 /nobreak >nul
start YimTools_alfa.exe
exit

:goodbye_EN
echo "Thank you for using YimTools!"
echo "Exiting in 3 seconds."
timeout /t 3 /nobreak >nul
exit

:exit_EN
echo Exiting...
exit /b



:russianscript

:: Skip update (for debug&develop)
  goto menu_RU


:: Check for updates
echo ¯à®¢¥àª  ­ «¨ç¨ï ­®¢®© ¢¥àá¨¨ YimTools_alfa.exe...
powershell -command "& { Invoke-WebRequest -Uri '%updateScriptUrl%' -OutFile '%scriptFolder%YimTools_alfa.exe.new' }"

:: Compare the current script with the updated version
fc "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
 if errorlevel 1 (
    echo Ž¡­®¢«¥­¨¥ ­ ©¤¥­®! ‡ £àã§ª  ­®¢®© ¢¥àá¨¨ YimTools_alfa.exe ...
    move /y "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
	cls
    echo à®£à ¬¬  ãá¯¥è­® ®¡­®¢«¥­ !
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (
    echo “ ¢ á ã¦¥ á¢¥¦ ï ¢¥àá¨ï ¯à®£à ¬¬ë.
    del "%scriptFolder%YimTools_alfa.exe.new" >nul
    echo "‚®§¢à é ¥¬áï ¢ £« ¢­®¥ ¬¥­î ..."
    timeout /t 1 /nobreak >nul
    goto menu_RU
)


	
:: Continue with the main script

:menu_RU

cls
echo "  ______   ______   ______   ______   ______   ______   ______ "
echo " /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/ "
echo "                                                               "
echo "                    YimTools exe edition                       "
echo "                                                               "
echo "                  ‚¥àá¨ï áªà¨¯â : alfa 0.0.0.3                 "
echo "  ______   ______   ______   ______   ______   ______   ______ "
echo " /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/ "


echo ------------------------------------------------------------------
echo   â  ¯à®£à ¬¬  ã¯à®áâ¨â ¯à®æ¥áá áª ç¨¢ ­¨ï á¢¥¦¨å ¢¥àá¨© YimMenu,
echo   áªà¨¯â®¢ ª ­¥¬ã ¨ ¢®§¬®¦­® ¤àã£¨å ¯à¨ïâ­ëå ¯«îè¥ª. 
echo                   ~ ®«ì§ã©â¥áì á ã¤®¢®«ìáâ¢¨¥¬ ~
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo 			ƒ« ¢­®¥ ¬¥­î
echo ------------------------------------------------------------------
echo ‚ë¡¥à¨ çâ® å®ç¥èì á¤¥« âì:
echo 1. ‘ª ç âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à (¢ ¯ ¯ªã ‡ £àã§ª¨ ¨«¨ ­   ¡®ç¨© áâ®«)
echo 2. ‘ª ç âì ç¨â ¬¥­î YimMenu (¢ ¯ ¯ªã ‡ £àã§ª¨ ¨«¨ ­   ¡®ç¨© áâ®«)
echo 3. “áâ ­®¢¨âì ¤®¯®«­¥­¨ï-áªà¨¯âë ¤«ï YimMenu (¢ ¯ ¯ªã: YimMenu\scripts)
echo 4. Žç¨áâ¨âì ¯ ¯ªã ª¥è  YimMenu (¡ëáâàë© ä¨ªá ¯®á«¥ ®¡­®¢ë GTA V)
echo 5. „®¯®«­¨â¥«ì­ë¥ ¯«îèª¨
@echo.
echo 7.        \\ Œ­¥ «¥­ì, á¤¥« ©áï ¢á¥ á ¬® //
echo ------------------------------------------------------------------
echo 8. ˆ­áâàãªæ¨ï ¯® § ¯ãáªã ç¨â 
echo 9. ‚ëå®¤
echo …á«¨ ¯ ¯ª  § £àã§®ª ­ å®¤¨âáï ­¥ ¢ ­ã¦­®¬ ¬¥áâ¥ ¨«¨ ¥ñ ­¥âã, 
echo â®£¤  ¯® ã¬®«ç ­¨î § £àã§ª¨ ¡ã¤ãâ ­  à ¡®ç¥¬ áâ®«¥.

choice /c 123456789 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 7 goto auto_mode_RU
 if errorlevel 6 goto here_nothing_now
 if errorlevel 5 goto optional_downloads_RU
 if errorlevel 4 goto delete_cache_folder_RU
 if errorlevel 3 goto choice_addons_RU
 if errorlevel 2 goto download_yimmenu_RU
 if errorlevel 1 goto choice_injectors_RU
 

:instructions_RU

cls
echo ------------------------------------------------------------------
echo 	  Š ª ãáâ ­®¢¨âì/¨á¯®«ì§®¢ âì ç¨â ¬¥­î YimMenu
echo ------------------------------------------------------------------
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 1                   ‡ ¯ãáâ¨â¥ GTA 5                  1 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º „®¦¤¨â¥áì ¯®«­®© § £àã§ª¨ ¢ áî¦¥â­ë© à¥¦¨¬ ¨«¨ ®­« ©­. º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

timeout /t 3 /nobreak >nul
@echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 2            ‡ ¯ãáâ¨â¥ ¯à®£à ¬¬ã ¨­¦¥ªâ®à            2 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º  ¨ ¢ë¡¥à¨â¥ ä ©« YimMenu.dll ¤«ï ¨­¦¥ªâ  ¢ ¨£àã        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

timeout /t 2 /nobreak >nul
@echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 3     ‚ë¡¥à¨â¥ ã¦¥ § ¯ãé¥­­ë© ¯à®æ¥áá (gta5.exe)     3 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º  ¯®á«¥ ç¥£® ¢ë¯®«­¨â¥ ¨­¦¥ªâ ç¨â  ­ ¦ ¢ ª­®¯ªã INJECT  º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

timeout /t 2 /nobreak >nul
@echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 4        ®á«¥ ¨­¦¥ªâ  § ©¤¨â¥ ¢ GTA V.              4 º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

timeout /t 2 /nobreak >nul
@echo.
echo    ______                                    ______
echo   /_____/ …á«¨ ¢á¥ ¯à®è«® ãá¯¥è­®, ¢ ¨£à¥   /_____/
echo  /_____/ ¤®«¦­® ®â®¡à §¨âìáï ®ª­® YimMenu. /_____/

timeout /t 2 /nobreak >nul
@echo.
echo -------------------------------------------------------------------
echo -------------------------------------------------------------------
echo  =  „«ï ®âªàëâ¨ï/§ ªàëâ¨ï ç¨â-¬¥­î ­ ¦¬¨â¥ ª« ¢¨èã INSERT.
echo  =  —â®¡ë ®¡­®¢¨âì ª¥è § ©¤¨â¥ ¢ ­ áâà®©ª¨ ç¨â-¬¥­î ¨ ­ ¦¬¨â¥ ª­®¯ªã ŽŽ‚ˆ’œ Š…˜/Update Cache.
echo  =  „«ï áªàëâ¨ï ®ª­  ç¨â  ¢ «¥¢®¬ ¢¥àå­¥¬ ã£«ã 
echo      ¯à®©¤¨â¥ ¢ ­ áâà®©ª¨: Settings - GUI ¨ ã¡¥à¨â¥ £ «®çªã á ¯ã­ªâ  Show Overlay 

timeout /t 5 /nobreak >nul
@echo.
@echo.
echo ===================================================================
echo   ¦¬¨â¥ 1 ¤«ï ¢ëå®¤  ¢ £« ¢­®¥ ¬¥­î ...

timeout /t 1 /nobreak >nul

choice /c 1 /n
 if errorlevel 1 goto menu_RU
 
 

:choice_injectors_RU

cls
echo ------------------------------------------------------------------
echo 	‘ª ç âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à
echo ------------------------------------------------------------------
echo ‚ë¡¥à¨â¥ ¯à®£à ¬¬ã-¨­¦¥ªâ®à:
echo 1. Xenos
echo 2. Fate_Injector
echo 3. ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î
echo ------------------------------------------------------------------

choice /c 123 /n
 if errorlevel 3 goto menu_RU
 if errorlevel 2 goto download_fate_injector_RU
 if errorlevel 1 goto download_xenos_RU

:check_yimmenu_E_RU

cls
set /p yn=ˆá¯®«ì§®¢ «¨-«¨ ¢ë YimMenu à ­¥¥? (Y/N): 
if /i "%yn%"=="Y" (
goto download_extras_addon_RU
) else (
    cls
    echo "®¦ «ã©áâ  á­ ç «  § £àã§¨â¥ ¨ § ¯ãáâ¨â¥ YimMenu ¯¥à¥¤ § £àã§ª®© Extras Addon."
    echo "®á«¥ § ¯ãáª  YimMenu, ¢ë ¬®¦¥â¥ ¢¥à­ãâìáï ¢ íâ®â ¯ã­ªâ ¨ § £àã§¨âì Extras Addon."
    echo "„«ï § ¯ãáª  YimMenu ¢ ¬ ­¥®¡å®¤¨¬® § £àã§¨âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à FateInjector, Xenos ¨ ¨­ë¥."
	echo ------------------------------------------------------------------
	echo "¥à¥¤ § ¯ãáª®¬ YimMenu § £àã§¨â¥áì ¢ áî¦¥â­ë© à¥¦¨¬ ¨«¨ ®­« ©­."
	echo "…á«¨ ¢ë ­¥ §­ ¥â¥, ª ª ¨á¯®«ì§®¢ âì YimMenu, ­ ¦¬¨â¥ 6 ¢ £« ¢­®¬ ¬¥­î, çâ®¡ë ¯®«ãç¨âì ¨­áâàãªæ¨¨."
	echo ------------------------------------------------------------------
	echo "‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î (15á¥ª)."
    timeout /t 15 /nobreak >nul
    cls
    goto menu_RU
	)
	
:check_yimmenu_U_RU

set /p yn=ˆá¯®«ì§®¢ «¨-«¨ ¢ë YimMenu à ­¥¥? (Y/N): 
if /i "%yn%"=="Y" (
 goto download_ultimate_menu_RU
 ) else (
	cls
    echo "®¦ «ã©áâ  á­ ç «  § £àã§¨â¥ ¨ § ¯ãáâ¨â¥ YimMenu ¯¥à¥¤ § £àã§ª®© Extras Addon."
    echo "®á«¥ § ¯ãáª  YimMenu, ¢ë ¬®¦¥â¥ ¢¥à­ãâìáï ¢ íâ®â ¯ã­ªâ ¨ § £àã§¨âì Extras Addon."
    echo "„«ï § ¯ãáª  YimMenu ¢ ¬ ­¥®¡å®¤¨¬® § £àã§¨âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à FateInjector, Xenos ¨ ¨­ë¥."
	echo ------------------------------------------------------------------
	echo "¥à¥¤ § ¯ãáª®¬ YimMenu § £àã§¨â¥áì ¢ áî¦¥â­ë© à¥¦¨¬ ¨«¨ ®­« ©­."
	echo "…á«¨ ¢ë ­¥ §­ ¥â¥, ª ª ¨á¯®«ì§®¢ âì YimMenu, ­ ¦¬¨â¥ 6 ¢ £« ¢­®¬ ¬¥­î, çâ®¡ë ¯®«ãç¨âì ¨­áâàãªæ¨¨."
	echo ------------------------------------------------------------------
	echo "‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î (15á¥ª)."
	timeout /t 15 /nobreak >nul
	cls
	goto menu_RU
    )

:delete_cache_folder_RU

cls
echo "“¤ «¥­¨¥ ª¥è  YimMenu ­¥®¡å®¤¨¬® ’Ž‹œŠŽ ¥á«¨ ¢ë ®¡­®¢¨«¨ YimMenu.dll, ­® á¡®¨ ¢á¥ ¥é¥ ¯à®¨áå®¤ïâ."
echo "…á«¨ íâ® ­¥ à¥è¨â ¯à®¡«¥¬ã, ¯à®¢¥àìâ¥ áâà ­¨æã ¯à®¡«¥¬ ­  GitHub ¯®  ¤à¥áã https://github.com/YimMenu/YimMenu/issues"
timeout /t 5 /nobreak >nul
rmdir /s /q "%/YimMenu%\cache"
cls
echo "Š¥è ¡ë« ãá¯¥è­® ®ç¨é¥­."
echo "‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î ..."
timeout /t 2 /nobreak >nul
goto menu_RU

:download_extras_addon_RU

cls
echo ------------------------------------------------------------------
echo 	‡ £àã§ª  Extras Addon ¨§ à¥¯®§¨â®à¨ï
echo ------------------------------------------------------------------
echo deleting old files...
timeout /t 1 /nobreak >nul
del "%/Scripts%\Extras-Addon.lua.old" >nul 2>&1
del "%/Scripts%\Extras-data.lua.old" >nul 2>&1
del "%/Scripts%\json.lua.old" >nul 2>&1
echo old files was deleted.
timeout /t 1 /nobreak >nul
cls
echo à®¢¥àª  ­ «¨ç¨ï Extras Addon...
timeout /t 2 /nobreak >nul
cls

if exist "%/Scripts%\Extras-Addon.lua" (
  echo "Found Extras-Addon.lua , Archivation files..."
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\Extras-Addon.lua" Extras-Addon.lua.old
  rename "%/Scripts%\Extras-data.lua" Extras-data.lua.old
  rename "%/Scripts%\json.lua" json.lua.old
  goto dwn_extras_noexist 
  ) else (
      echo "No old Extras-Addon.lua was found. Clean installing..."
	  :dwn_extras_noexist
      del "%/Scripts%\Extras-Addon.lua" >nul 2>&1
      del "%/Scripts%\Extras-data.lua" >nul 2>&1
      del "%/Scripts%\json.lua" >nul 2>&1
      echo "Downloading new version of Extras-Addon.lua from the repository..."
	  powershell -command "& { Invoke-WebRequest -Uri '%Extras-AddonUrl%' -OutFile '%/Scripts%\Extras-Addon.lua' }"
      powershell -command "& { Invoke-WebRequest -Uri '%Extras-JsonUrl%' -OutFile '%/Scripts%\json.lua' }"
	  powershell -command "& { Invoke-WebRequest -Uri '%Extras-DataUrl%' -OutFile '%/Scripts%\Extras-data.lua' }"
	     )
	  
if not exist "%/Scripts%\Extras-Addon.lua" (
  echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« Extras-Addon.lua. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥."
  timeout /t 2 /nobreak >nul
  echo:
  echo " Restoring archived files..."
  timeout /t 1 /nobreak >nul
  del "%/Scripts%\Extras-Addon.lua" >nul 2>&1
  del "%/Scripts%\json.lua" >nul 2>&1
  del "%/Scripts%\Extras-data.lua" >nul 2>&1
  rename "%/Scripts%\Extras-Addon.lua.old" Extras-Addon.lua
  rename "%/Scripts%\json.lua.old" json.lua
  rename "%/Scripts%\Extras-data.lua.old" Extras-data.lua
  timeout /t 1 /nobreak >nul
  @echo.
  @echo.
  echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
  echo º !                     WARNING                        ! º
  echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
  echo º  old files EXTRAS-ADDON was restored. Download failed  º
  echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
  @echo.
  echo ----------------------------------------------------------
  echo " ¦¬¨â¥ 1 ¤«ï ¢ëå®¤  ¢ £« ¢­®¥ ¬¥­î"
  choice /c 1 /n
  if errorlevel 1 goto menu_RU
  		   
			   
              ) else (
		          if not exist "%/Scripts%\json.lua" (
                  echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« json.lua. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥." 
		          timeout /t 2 /nobreak >nul
	              echo:
	              echo " Restoring archived files..."
                  timeout /t 1 /nobreak >nul
                  del "%/Scripts%\Extras-Addon.lua" >nul 2>&1
				  del "%/Scripts%\json.lua" >nul 2>&1
				  del "%/Scripts%\Extras-data.lua" >nul 2>&1
                  rename "%/Scripts%\Extras-Addon.lua.old" Extras-Addon.lua
                  rename "%/Scripts%\json.lua.old" json.lua
                  rename "%/Scripts%\Extras-data.lua.old" Extras-data.lua
                  timeout /t 1 /nobreak >nul
                  @echo.
                  echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
                  echo º !                     WARNING                        ! º
                  echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
                  echo º  old files EXTRAS-ADDON was restored. Download failed  º
                  echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
				  @echo.
                  echo ----------------------------------------------------------
                  echo " ¦¬¨â¥ 1 ¤«ï ¢ëå®¤  ¢ £« ¢­®¥ ¬¥­î"
				  choice /c 1 /n
                  if errorlevel 1 goto menu_RU
				  
  
				  ) else (
				      if not exist "%/Scripts%\Extras-data.lua" (
	                    echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« Extras-data.lua. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥." 
	                    echo:
	                    echo " Restoring archived Extras-data.lua..."
	                    echo:
	                    rename "%/Scripts%\Extras-data.lua.old" Extras-data.lua
			            cls
			            echo " old Extras-data.lua was restored "
                        timeout /t 2 /nobreak >nul
						goto download_extras_addon_RU_Success
						) else (
				  
				  
				  
				:download_extras_addon_RU_Success
	             cls
				 echo ==================================================
	             echo "Extras-addon ãá¯¥è­® § £àã¦¥­. "
				 @echo.
				 @echo.
				 echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\Extras-Addon.lua"
				 timeout /t 2 /nobreak >nul
				 echo --------------------------------------------------
	             echo "Json ãá¯¥è­® § £àã¦¥­. "
				 @echo.
				 @echo.
	             echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\json.lua"
				 timeout /t 2 /nobreak >nul
				 echo --------------------------------------------------
	             echo "Extras-data ãá¯¥è­® § £àã¦¥­. "
				 @echo.
				 @echo.
	             echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\Extras-data.lua"
				 echo ==================================================
				 timeout /t 2 /nobreak >nul
				 @echo.
				 @echo.
	             echo deleting old files...
				 timeout /t 1 /nobreak >nul
				 del "%/Scripts%\Extras-Addon.lua.old" >nul 2>&1
                 del "%/Scripts%\Extras-data.lua.old" >nul 2>&1
                 del "%/Scripts%\json.lua.old" >nul 2>&1
				 cls
				 echo    ______                                    ______
                 echo   /_____/                                   /_____/
                 echo  /_____/ Extras Addon ãá¯¥è­® § £àã¦¥­.    /_____/
				 echo /_____/                                   /_____/
				 @echo.
	             timeout /t 2 /nobreak >nul
	             echo --------------------------------------------------
	             echo "‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î(10á¥ª)..."
	             timeout /t 10 /nobreak >nul
                 cls
                 goto menu_RU 
				               )
					     )
		             )
		       
	
:download_ultimate_menu_RU
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
		echo "Ultimate_Menu downloaded successfully. "
		echo "File Location: %/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua"
	)
timeout /t 10 /nobreak >nul
cls
goto menu_RU
	
:download_yimmenu_RU
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
    echo "YimMenu downloaded successfully. "
	echo "ƒ¤¥ ä ©«?   ’ãâ: %/Downloads%\YimMenu_3179.dll"
    echo "Returning to the main menu in 3 seconds."
)
timeout /t 3 /nobreak >nul
cls
goto menu_RU



:download_fate_injector_RU
cls
echo ------------------------------------------------------------------
echo 	‘ª ç âì ¨­¦¥ªâ®à FateInjector ¨§ à¥¯®§¨â®à¨ï 
echo ------------------------------------------------------------------
echo "à®¢¥àª  ­ «¨ç¨ï FateInjector.exe ¢ ¯ ¯ª¥ ‡ £àã§ª¨ ¨«¨ ­  à ¡®ç¥¬ áâ®«¥ ..."
timeout /t 1 /nobreak >nul
cls

if exist "%/Downloads%\FateInjector.exe" (
 echo " ©¤¥­ FateInjector, ‚ ¬ ­¥ ­ã¦­® áª ç¨¢ âì ¥£® á­®¢ ."
 timeout /t 1 /nobreak >nul
 goto quest_start_Fateinjector_RU
 ) else (
   echo "‡ £àã§ª  FateInjector ..."
   powershell -command "& { Invoke-WebRequest -Uri '%FateInjectorUrl%' -OutFile '%/Downloads%\FateInjector.exe' }"
   if not exist "%/Downloads%\FateInjector.exe" (
    echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« FateInjector.exe. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ."
    ) else (
      cls
      echo "FateInjector ãá¯¥è­® § £àã¦¥­. "
	  echo "ƒ¤¥ ä ©«?   ’ãâ: %/Downloads%\Xenos64.exe"
	  timeout /t 3 /nobreak >nul )
	  )
	  
:quest_start_Fateinjector_RU
cls		  
set /p yn=•®â¨â¥ § ¯ãáâ¨âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à FateInjector.exe? (Y/N): 
if /i "%yn%"=="y" (
goto start_FateInjector_RU
) else (
cls
echo "‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î..."
timeout /t 1 /nobreak >nul
cls
goto menu_RU 

:download_xenos_RU
cls
echo ------------------------------------------------------------------
echo 	‘ª ç âì ¨­¦¥ªâ®à Xenos64 ¨§ à¥¯®§¨â®à¨ï 
echo ------------------------------------------------------------------
echo " à®¢¥àª  ­ «¨ç¨ï Xenos64.exe ¢ ¯ ¯ª¥ ‡ £àã§ª¨ ¨«¨ ­  à ¡®ç¥¬ áâ®«¥ ..."
timeout /t 1 /nobreak >nul
cls

if exist "%/Downloads%\Xenos64.exe" (
echo "  ©¤¥­ Xenos64, ‚ ¬ ­¥ ­ã¦­® áª ç¨¢ âì ¥£® á­®¢ ."
timeout /t 2 /nobreak >nul
goto quest_start_Xenos_RU
) else (
  echo "‡ £àã§ª  Xenos64 ..."
  powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\Xenos64.exe' }"
  if not exist "%/Downloads%\Xenos64.exe" (
  echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« Xenos64.exe. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥."
  ) else (
    cls
    echo "Xenos64 Injector downloaded successfully. "
	@echo.
	echo "File Location: %/Downloads%\Xenos64.exe"
	timeout /t 1 /nobreak >nul )
	goto quest_start_Xenos_RU
	)

:quest_start_Xenos_RU
cls
set /p yn=•®â¨â¥ § ¯ãáâ¨âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à Xenos64.exe? (Y/N): 
if /i "%yn%"=="y" (
goto start_Xenos_RU
) else (
cls
echo "‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î..."
timeout /t 1 /nobreak >nul
cls
goto menu_RU )


:choice_addons_RU
cls
echo ------------------------------------------------------------------
echo 	Download addons (to /scripts)
echo ------------------------------------------------------------------
echo Choose addon:
echo 1. Extras-Addon
echo 2. Ultimate-Menu
echo 3. Back to Main Menu
echo ------------------------------------------------------------------
echo 4. Open YimMenu/scripts folder

echo More addons may be added in the future!

choice /c 1234 /n
 if errorlevel 4 goto open_scripts_folder_RU
 if errorlevel 3 goto menu_RU
 if errorlevel 2 goto check_yimmenu_U_RU
 if errorlevel 1 goto check_yimmenu_E_RU


:optional_downloads_RU
cls
echo ------------------------------------------------------------------
echo 	Optional Downloads
echo ------------------------------------------------------------------
echo Choose an option:
echo 1. Get XML Maps/Vehicles (Opens in Browser)
echo 2. Download Animations Dictionary (To YimMenu Root Folder)
echo 3. Settings_4_Yim options ( custom settings, maybe you like that )
echo 4. Back to Main Menu
echo ------------------------------------------------------------------
echo 5. Open YimMenu/scripts folder

echo More optional downloads may be added in the future!

choice /c 12345 /n
 if errorlevel 5 goto open_scripts_folder_RU
 if errorlevel 4 goto menu_RU
 if errorlevel 3 goto choice_settings_RU
 if errorlevel 2 goto download_animDictsCompact_RU
 if errorlevel 1 goto download_XML_Maps_RU

:download_XML_Maps_RU
echo Opening MagicModz89's MEGA drive in a browser window...
start "XML Maps" "%XML_mapsUrl%"

:: cscript //nologo BringToFront.vbs

echo To use these, download the file as zip and extract the corresponding contents to %/YimMenu%\xml_maps and xml_vehicles
echo Returning to Optional Downloads Menu
timeout /t 5 /nobreak >nul
goto optional_downloads_RU

:download_animDictsCompact_RU
cls
echo ------------------------------------------------------------------
echo 	Downloading Animations Dictionary from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of animDictsCompact.json"
del "%/YimMenu%\animDictsCompact.json" >nul 2>&1

echo "Downloading new version of animDictsCompact.json from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/animDictsCompact.json' }"

if not exist "%/YimMenu%/animDictsCompact.json" (
		echo "Error: Failed to download Animations. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Extras Addon downloaded successfully. "
		echo "File Location: %/YimMenu%/animDictsCompact.json"
		echo "Returning to the main menu in 5 seconds."
	)
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_RU

:choice_settings_RU

cls
echo ------------------------------------------------------------------
echo 	     YimMenu's Settings.json options
echo ------------------------------------------------------------------
echo 1. Import custom settings ( my settings, maybe you like that )
echo 2. Restore settings ( restore your settings after custom )
choice /c 12 /n
 if errorlevel 2 goto restore_settings_RU
 if errorlevel 1 goto import_settings_RU


:import_settings_RU
cls
echo ------------------------------------------------------------------
echo 	Š áâ®¬­ë¥ ­ áâà®©ª¨ settings.json ¤«ï ç¨â ¬¥­î YimMenu 
echo ------------------------------------------------------------------
echo " à®¢¥àª  ­ «¨ç¨ï ã¦¥ áãé¥áâ¢ãîé¥£® ä ©«  ­ áâà®¥ª... "

if exist "%/YimMenu%/settings.json" (

echo "¥ª ¯ ã¦¥ áãé¥áâ¢ãîé¨å ­ áâà®¥ª settings.json ..."
timeout /t 2 /nobreak >nul
rename "%/YimMenu%\settings.json" settings.json.old
timeout /t 1 /nobreak >nul
goto dwn_settings_noexist
) else (
:dwn_settings_noexist
echo "“áâ ­®¢ª  ª áâ®¬­®£® settings.json ®â  ¢â®à  YimTools..."
timeout /t 1 /nobreak >nul
del "%/YimMenu%\settings.json" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%settingsUrl%' -OutFile '%/YimMenu%/settings.json' }"

if not exist "%/YimMenu%/settings.json" (
		echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« settings.json. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥."
	) else (
	    cls
		echo "Š áâ®¬­ë¥ ­ áâà®©ª¨ ãá¯¥è­® ãáâ ­®¢«¥­ë. "
		echo "ƒ¤¥ ä ©«? ’ãâ: %/YimMenu%/settigs.json"
		echo "Returning to the main menu in 5 seconds." )
timeout /t 5 /nobreak >nul
cls
goto menu_RU )

:restore_settings_RU
cls
echo ------------------------------------------------------------------
echo 	‚®áâ ­®¢«¥­¨¥ ­ áâà®¥ª settings.json ¤«ï ç¨â ¬¥­î YimMenu 
echo ------------------------------------------------------------------
echo " à®¢¥àª  ­ «¨ç¨ï ¡¥ª ¯  ä ©«  settigs.json... "
timeout /t 2 /nobreak >nul
if exist "%/YimMenu%/settings.json.old" (
echo " ‚ë¯®«­ï¥âáï ¢®ááâ ­®¢«¥­¨¥ ä ©«  settigs.json... "
timeout /t 1 /nobreak >nul
del "%/YimMenu%\settings.json" >nul 2>&1
rename "%/YimMenu%\settings.json.old" settings.json
echo " ‚®ááâ ­®¢«¥­¨¥ ä ©«  settigs.json ¯à®è«® “‘…˜Ž "
timeout /t 2 /nobreak >nul
goto menu_RU
) else (
cls
echo " íª ¯ ä ©«  settings.json … €‰„… "
timeout /t 3 /nobreak >nul
goto menu_RU )

:: //////////////////////////////////////////////////////////////////////
:: \\\\\\\\\\\\\ \\\\\\\\\\\ astions link \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
:: /////////////////////////////////////////////////////////////////////

:open_scripts_folder_RU
start %/Scripts%
goto choice_addons_RU

:restart_RU
echo "‡ ¯ãáª ­®¢®© ¢¥àá¨¨ YimTools ..."
timeout /t 2 /nobreak >nul
start YimTools_alfa.exe
exit

:start_Xenos_RU

cls
echo ‡ ¯ãáª ¯à®£à ¬¬ë-¨­¦¥ªâ®à  Xenos ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\Xenos64.exe
:: start Xenos64.exe
exit

:start_instructions_Xenos
cls
echo § ¯ãáª â¥ªáâ®¢®© ¨­áâàãªæ¨¨ ¨­¦¥ªâ  YimMenu
start "" %/Downloads%\instructions_Xenos.txt
exit

:start_FateInjector_RU

cls
echo ‡ ¯ãáª ¯à®£à ¬¬ë-¨­¦¥ªâ®à  FateInjector ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\FateInjector.exe
:: FateInjector.exe
exit

:here_nothing_now
cls
echo ’ãâ ¯®ª  çâ® ­¨ç¥£® ­¥âã, ¢®§¬®¦­® ¢ ¡ã¤ãé¥¬
echo ¯®ï¢¨âáï ª ª ï-­¨¡ã¤ì ­®¢ ï äã­ªæ¨ï...
timeout /t 2 /nobreak >nul
goto menu_RU

:goodbye_RU
echo "‘¯ á¨¡® §  ¨á¯®«ì§®¢ ­¨¥ YimTools "
echo "à¨ïâ­®© ¨£àë!"
timeout /t 3 /nobreak >nul
exit

:exit_RU
echo ‚ëå®¤ ...
exit /b


:auto_mode_RU

cls
echo test auto_mode_RU
timeout /t 1 /nobreak >nul

cls
:: ------------- YimMenu -------------------------------

echo ------------------------------------------------------------------
echo 	YimMenu.dll
echo ------------------------------------------------------------------
echo "Deleting old YimMenu.dll "
del "%/Downloads%\YimMenu.dll" >nul 2>&1
cls
echo "Downloading new version of YimMenu.dll from the repository..."
powershell -command "& { Invoke-WebRequest -Uri '%YimMenuUrl%' -OutFile '%/Downloads%\YimMenu_3179.dll' }"

if exist "%/Downloads%\YimMenu_3179.dll" (
 cls
 echo "YimMenu downloaded successfully. "
 echo "ƒ¤¥ ä ©«?   ’ãâ: %/Downloads%\YimMenu_3179.dll"
 timeout /t 2 /nobreak >nul

:: ------------- Xenos64 -------------------------------

 echo ------------------------------------------------------------------
 echo 	Xenos64.exe
 echo ------------------------------------------------------------------

 echo " à®¢¥àª  ­ «¨ç¨ï Xenos64.exe ¢ ¯ ¯ª¥ ‡ £àã§ª¨ ¨«¨ ­  à ¡®ç¥¬ áâ®«¥ ..."
 timeout /t 1 /nobreak >nul
 cls

 if exist "%/Downloads%\Xenos64.exe" (
  echo "  ©¤¥­ Xenos64, ‚ ¬ ­¥ ­ã¦­® áª ç¨¢ âì ¥£® á­®¢ ."
  timeout /t 2 /nobreak >nul
  goto start_Xenos_RU
 ) else (
   echo "‡ £àã§ª  Xenos64 ..."
   powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\Xenos64.exe' }"
   powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_instructionstxtUrl%' -OutFile '%/Downloads%\instructions_Xenos.txt' }"
   if not exist "%/Downloads%\Xenos64.exe" (
    echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« Xenos64.exe. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥."
   ) else (
     cls
     echo "Xenos64 § £àã¦¥­ ãá¯¥è­®. "
	 @echo.
	 echo "File Location: %/Downloads%\Xenos64.exe"
	 timeout /t 1 /nobreak >nul )
	 cls
     echo ‡ ¯ãáª ¯à®£à ¬¬ë-¨­¦¥ªâ®à  Xenos ...
     timeout /t 2 /nobreak >nul
     start "" %/Downloads%\Xenos64.exe
	 timeout /t 2 /nobreak >nul
	 cls
	 echo § ¯ãáª â¥ªáâ®¢®© ¨­áâàãªæ¨¨ ¨­¦¥ªâ  YimMenu
	 start "" %/Downloads%\instructions_Xenos.txt
	 exit
	   )
) else (  
  echo "Error: Failed to download YimMenu. Check the internet connection or the source URL."
  timeout /t 2 /nobreak >nul
  goto menu_RU )
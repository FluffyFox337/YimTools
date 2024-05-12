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


:://///////////////////////////////////////////////////////////////
set "YimTools_version=alfa 0.0.0.5"
:://///////////////////////////////////////////////////////////////



echo ///////// Script Version: %YimTools_version%  //////////  
timeout /t 1 /nobreak >nul

:: ////////////////// FOLDERS SETS //////////////////////////////////////////////////////

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


:: ////////////////// Download URL SETS //////////////////////////////////////////////////////

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
set "YimMenu_instructionstxtUrl=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/items/instructions_Xenos.txt"

:: ////////////////// NAMES DOWNLOADED FILES SETS //////////////////////////////////////////////////////

set "name_dwn_YimTools=YimTools_alfa.exe.new"
set "name_YimTools=YimTools_alfa.exe"

set "name_Xenos=Xenos64.exe"
set "name_Xenos-instructions=instructions_Xenos.txt"
set "name_FateInjector=FateInjector.exe"

set "name_YimMenu=YimMenu_3179.dll"
set "name_YimMenu-settings=settings.json"

set "name_Extras-Addon=Extras-Addon.lua"
set "name_Extras-json=json.lua"
set "name_Extras-data=Extras-data.lua"

set "name_UltimateMenu=Ultimate_Menu_For_YimMenu_V2.1.1.68.lua"
set "name_animDictsCompact=animDictsCompact.json"


:languageQUEST
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ?      Choice language  / ‚ë¡¥à¨â¥ ï§ëª              ? º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo ³ 1  English                                           1 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 2  ãááª¨©                                           2 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo [3]  Exit / ‚ëå®¤

choice /c 123 /n
 if errorlevel 3 goto goodbye_RU
 if errorlevel 2 goto russianscript
 if errorlevel 1 goto englishscript
 


:englishscript

:: Skip update (for debug&develop)
:: goto menu_EN


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
:: goto menu_RU


:: Check for updates

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º   à®¢¥àª  ­ «¨ç¨ï ­®¢®© ¢¥àá¨¨ %name_YimTools%...             º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul

powershell -command "& { Invoke-WebRequest -Uri '%updateScriptUrl%' -OutFile '%scriptFolder%%name_dwn_YimTools%' }"

:: Compare the current script with the updated version
fc "%scriptFolder%%name_dwn_YimTools%" "%scriptFolder%%name_YimTools%" >nul
 if errorlevel 1 (
 
    echo ³ Ž¡­®¢«¥­¨¥ ­ ©¤¥­®! ‡ £àã§ª  ­®¢®© ¢¥àá¨¨ %name_YimTools% ...    ³
    echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
	
	rename "%scriptFolder%%name_dwn_YimTools%" %name_YimTools%
    ::move /y "%scriptFolder%%name_YimTools%.new" "%scriptFolder%%name_YimTools%" >nul
	::del "%scriptFolder%%name_YimTools%.new" >nul 2>&1s
	
    echo º            à®£à ¬¬  ãá¯¥è­® ®¡­®¢«¥­ !                          º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
    echo ----------------------------------------------------------------------
    echo ’¥ªãé ï ¢¥àá¨ï: %YimTools_version%
	echo [~]  ¥à¥§ ¯ãáª.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (

    del "%scriptFolder%%name_dwn_YimTools%" >nul 2>&1s
	
    echo º            “ ¢ á ã¦¥ á ¬ ï ­®¢ ï ¢¥àá¨ï                          º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
    echo ----------------------------------------------------------------------
    echo ’¥ªãé ï ¢¥àá¨ï: %YimTools_version%
    timeout /t 1 /nobreak >nul
    goto menu_RU
)


	
:: Continue with the main script

:menu_RU

cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³   ______   ______   ______   ______   ______   ______   ______    ³
echo ³  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    ³
echo ³                                                                   ³
echo ³                     YimTools exe edition                          ³
echo ³                                                                   ³
echo ³                   ‚¥àá¨ï áªà¨¯â : %YimTools_version%                    ³
echo ³   ______   ______   ______   ______   ______   ______   ______    ³
echo ³  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    ³
echo ³                                                                   ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

echo ---------------------------------------------------------------------
echo   â  ¯à®£à ¬¬  ã¯à®áâ¨â ¯à®æ¥áá áª ç¨¢ ­¨ï á¢¥¦¨å ¢¥àá¨© YimMenu,
echo   áªà¨¯â®¢ ª ­¥¬ã ¨ ¢®§¬®¦­® ¤àã£¨å ¯à¨ïâ­ëå ¯«îè¥ª. 
echo                   ~ ®«ì§ã©â¥áì á ã¤®¢®«ìáâ¢¨¥¬ ~
echo ---------------------------------------------------------------------
timeout /t 2 /nobreak >nul
@echo.

echo ---------------------------------------------------------------------
echo 			ƒ« ¢­®¥ ¬¥­î
echo ---------------------------------------------------------------------
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ?           ‚ë¡¥à¨ çâ® å®ç¥èì á¤¥« âì                           ? º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 1 ‘ª ç âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à                                    1 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 2 ‘ª ç âì ç¨â ¬¥­î YimMenu                                      2 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 3 “áâ ­®¢¨âì ¤®¯®«­¥­¨ï-áªà¨¯âë ¤«ï YimMenu                     3 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 4 Žç¨áâ¨âì ¯ ¯ªã ª¥è  YimMenu (¡ëáâàë© ä¨ªá ¯®á«¥ ®¡­®¢ë GTA V) 4 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 5 „®¯®«­¨â¥«ì­ë¥ ¯«îèª¨                                         5 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 6                                                               6 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 7             \\ Œ­¥ «¥­ì, á¤¥« ©áï ¢á¥ á ¬® //                  º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo [8] ˆ­áâàãªæ¨ï ¯® § ¯ãáªã ç¨â .
echo [9] ‚ë©â¨ ¨§ ¯à®£à ¬¬ë.
echo ---------------------------------------------------------------------
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ …á«¨ ¯ ¯ª  § £àã§®ª ­ å®¤¨âáï ­¥ ¢ ­ã¦­®¬ ¬¥áâ¥ ¨«¨ ¥ñ ­¥âã,   ³
echo ³  â®£¤  ¯® ã¬®«ç ­¨î § £àã§ª¨ ¡ã¤ãâ ­  à ¡®ç¥¬ áâ®«¥.           ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

choice /c 123456789 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 7 goto here_nothing_now
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
@echo.
@echo.
echo ===================================================================
echo [1]  ¦¬¨â¥ 1 ¤«ï ¢ëå®¤  ¢ £« ¢­®¥ ¬¥­î ...

timeout /t 1 /nobreak >nul

choice /c 1 /n
 if errorlevel 1 goto menu_RU
 
 

:choice_injectors_RU

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º         ‘ª ç âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à                   º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo ³ 1  Xenos                                             1 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 2  Fate_Injector                                     2 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo [3]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.

choice /c 123 /n
 if errorlevel 3 goto menu_RU
 if errorlevel 2 goto download_fate_injector_RU
 if errorlevel 1 goto download_xenos_RU

:check_yimmenu_E_RU

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ?        ˆá¯®«ì§®¢ «¨-«¨ ¢ë YimMenu à ­¥¥? (Y/N)     ? º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

set /p yn=  ¦¬¨â¥ Y ¢ á«ãç ¥ ¯®«®¦¨â¥«ì­®£® ®â¢¥â : 
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

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ?        ˆá¯®«ì§®¢ «¨-«¨ ¢ë YimMenu à ­¥¥? (Y/N)     ? º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

set /p yn=  ¦¬¨â¥ Y ¢ á«ãç ¥ ¯®«®¦¨â¥«ì­®£® ®â¢¥â : 
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
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                         ‚ˆŒ€ˆ…                              ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º    “¤ «¥­¨¥ ª¥è  YimMenu ­¥®¡å®¤¨¬® ’Ž‹œŠŽ ¥á«¨ ¢ë ®¡­®¢¨«¨       º
echo º     YimMenu.dll, ­® á¡®¨ ¢á¥ ¥é¥ ¯à®¨áå®¤ïâ.                      º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 2 /nobreak >nul
echo ³ ‚ë¯®«­ï¥âáï ®âç¨áâª  ª¥è ...                                      ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 2 /nobreak >nul
rmdir /s /q "%/YimMenu%\cache"
echo ³ Š¥è ¡ë« ãá¯¥è­® ®ç¨é¥­.                                           ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 1 /nobreak >nul
echo ³  ‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î .                                           ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo ---------------------------------------------------------------------
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ …á«¨ íâ® ­¥ à¥è¨â ¯à®¡«¥¬ã, ¯à®¢¥àìâ¥ áâà ­¨æã ¯à®¡«¥¬ ­  GitHub  ³
echo ³  ¯®  ¤à¥áã https://github.com/YimMenu/YimMenu/issues .            ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

timeout /t 3 /nobreak >nul
cls

echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                         ‚ˆŒ€ˆ…                              ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º    “¤ «¥­¨¥ ª¥è  YimMenu ­¥®¡å®¤¨¬® ’Ž‹œŠŽ ¥á«¨ ¢ë ®¡­®¢¨«¨       º
echo º     YimMenu.dll, ­® á¡®¨ ¢á¥ ¥é¥ ¯à®¨áå®¤ïâ.                      º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo ³ ‚ë¯®«­ï¥âáï ®âç¨áâª  ª¥è ...                                      ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ Š¥è ¡ë« ãá¯¥è­® ®ç¨é¥­.                                           ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³  ‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î ..                                         ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo ---------------------------------------------------------------------
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ …á«¨ íâ® ­¥ à¥è¨â ¯à®¡«¥¬ã, ¯à®¢¥àìâ¥ áâà ­¨æã ¯à®¡«¥¬ ­  GitHub  ³
echo ³  ¯®  ¤à¥áã https://github.com/YimMenu/YimMenu/issues .            ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

timeout /t 6 /nobreak >nul
cls

echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                         ‚ˆŒ€ˆ…                              ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º    “¤ «¥­¨¥ ª¥è  YimMenu ­¥®¡å®¤¨¬® ’Ž‹œŠŽ ¥á«¨ ¢ë ®¡­®¢¨«¨       º
echo º     YimMenu.dll, ­® á¡®¨ ¢á¥ ¥é¥ ¯à®¨áå®¤ïâ.                      º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo ³ ‚ë¯®«­ï¥âáï ®âç¨áâª  ª¥è ...                                      ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ Š¥è ¡ë« ãá¯¥è­® ®ç¨é¥­.                                           ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³  ‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î ...                                        ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo ---------------------------------------------------------------------
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ …á«¨ íâ® ­¥ à¥è¨â ¯à®¡«¥¬ã, ¯à®¢¥àìâ¥ áâà ­¨æã ¯à®¡«¥¬ ­  GitHub  ³
echo ³  ¯®  ¤à¥áã https://github.com/YimMenu/YimMenu/issues .            ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

timeout /t 1 /nobreak >nul
goto menu_RU

:download_extras_addon_RU
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º        “áâ ­®¢ª   Extras Addon ¨§ à¥¯®§¨â®à¨ï          º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul
echo ³ “¤ «¥­¨¥ áâ àëå OLD ¡¥ª ¯®¢...                       ° ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-json%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-data%.old" >nul 2>&1

timeout /t 1 /nobreak >nul


if exist "%/Scripts%\%name_Extras-Addon%" (

  echo ³ Ž¡­ àã¦¥­ Extras-Addon.lua. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_Extras-Addon%" %name_Extras-Addon%.old
  rename "%/Scripts%\%name_Extras-json%" %name_Extras-json%.old
  rename "%/Scripts%\%name_Extras-data%" %name_Extras-data%.old
  
  echo ³ ¥ª ¯ á®§¤ ­. “áâ ­®¢ª  Extras-Addon...                ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-AddonUrl%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-JsonUrl%' -OutFile '%/Scripts%\%name_Extras-json%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-DataUrl%' -OutFile '%/Scripts%\%name_Extras-data%' }"
  
) else (
	  
    echo ³ Extras-Addon.lua ­¥ ®¡­ àã¦¥­. —¨áâ ï ãáâ ­®¢ª ...     ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
    del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1
	del "%/Scripts%\%name_Extras-json%" >nul 2>&1
    del "%/Scripts%\%name_Extras-data%" >nul 2>&1
      
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-AddonUrl%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-JsonUrl%' -OutFile '%/Scripts%\%name_Extras-json%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-DataUrl%' -OutFile '%/Scripts%\%name_Extras-data%' }"
	  
	timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_Extras-Addon%" (

  if exist "%/Scripts%\%name_Extras-json%" (
  goto continue_dwn_extras_addon 
  
  ) else (
	echo ³ ! ERROR: ¥ ã¤ «®áì áª ç âì ä ©« json.lua            ! ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	timeout /t 2 /nobreak >nul
	              
	echo ³ ! ‚®ááâ ­®¢«¥­¨¥ ¡¥ª ¯ ...                           ! ³
    echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1
	del "%/Scripts%\%name_Extras-json%" >nul 2>&1
    del "%/Scripts%\%name_Extras-data%" >nul 2>&1
	
    rename "%/Scripts%\%name_Extras-Addon%.old" %name_Extras-Addon%
    rename "%/Scripts%\%name_Extras-json%.old" %name_Extras-json%
    rename "%/Scripts%\%name_Extras-data%.old" %name_Extras-data%
    timeout /t 1 /nobreak >nul
    @echo.
    echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
    echo º !                     ‚ˆŒ€ˆ…                       ! º
    echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
    echo º  ¥ª ¯ ¢®ááâ ­®¢«¥­. ‡ £àã§ª  ­®¢ëå ä ©«®¢ … “„€‹€‘œ  º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
	@echo.
    echo ----------------------------------------------------------
    echo à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì 
    echo  ááë«ª¨ ­  ä ©« ¢ ª®¤¥.
    echo ----------------------------------------------------------
    echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	    )
				  
) else (

  echo ³ ! ERROR: ¥ ã¤ «®áì áª ç âì ä ©« Extras-Addon.lua    ! ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  
  echo ³ ! ‚®ááâ ­®¢«¥­¨¥ ¡¥ª ¯ ...                           ! ³
  echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
  timeout /t 1 /nobreak >nul
  del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1
  del "%/Scripts%\%name_Extras-json%" >nul 2>&1
  del "%/Scripts%\%name_Extras-data%" >nul 2>&1
  
  rename "%/Scripts%\%name_Extras-Addon%.old" %name_Extras-Addon%
  rename "%/Scripts%\%name_Extras-json%.old" %name_Extras-json%
  rename "%/Scripts%\%name_Extras-data%.old" %name_Extras-data%
  timeout /t 1 /nobreak >nul
  @echo.
  @echo.
  echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
  echo º !                     ‚ˆŒ€ˆ…                       ! º
  echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
  echo º  ¥ª ¯ ¢®ááâ ­®¢«¥­. ‡ £àã§ª  ­®¢ëå ä ©«®¢ … “„€‹€‘œ  º
  echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
  @echo.
  echo ----------------------------------------------------------
  echo à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì 
  echo  ááë«ª¨ ­  ä ©« ¢ ª®¤¥.
  echo ----------------------------------------------------------
  echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
  choice /c 1 /n
  if errorlevel 1 goto menu_RU
       )
		
:continue_dwn_extras_addon
					   
if exist "%/Scripts%\%name_Extras-data%" (
  goto download_extras_addon_RU_Success 
  
  ) else (
	echo ³ ! ERROR: ¥ ã¤ «®áì áª ç âì ä ©« Extras-data.lua     ! ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	timeout /t 1 /nobreak >nul
						
	echo ³ ! ‚®ááâ ­®¢«¥­¨¥ %name_Extras-data%...               ! ³
    echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	@echo.
	rename "%/Scripts%\%name_Extras-data%.old" %name_Extras-data%
    timeout /t 2 /nobreak >nul
	goto download_extras_addon_RU_Success_Data_Notice )
				  	  
:download_extras_addon_RU_Success
	             
echo ³ Extras-addon.lua ãá¯¥è­® § £àã¦¥­.                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
				 
timeout /t 1 /nobreak >nul
echo ³ Json.lua ãá¯¥è­® § £àã¦¥­.                            ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	             
timeout /t 1 /nobreak >nul
echo ³ Extras-data.lua ãá¯¥è­® § £àã¦¥­.                     ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	             
timeout /t 1 /nobreak >nul

echo ³  “¤ «¥­¨¥ ¡¥ª ¯ ...                                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-json%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-data%.old" >nul 2>&1
				 
				 
echo º ‘ªà¨¯â Extras-addon ãá¯¥è­® ãáâ ­®¢«¥­.               º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-Addon%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-json%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo  ‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î ç¥à¥§ 10 á¥ª...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 
				               

:download_extras_addon_RU_Success_Data_Notice
	             
echo ³ Extras-addon.lua ãá¯¥è­® § £àã¦¥­.                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
@echo.
@echo.
				 
timeout /t 1 /nobreak >nul
echo ³ Json.lua ãá¯¥è­® § £àã¦¥­.                            ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
@echo.
@echo.
	             
timeout /t 1 /nobreak >nul
echo ³ Extras-data.lua ¢®ááâ ­®¢«¥­. ‡ £àã§ª  ­¥ ã¤ « áì   ! ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
@echo.
@echo.
	             
echo ==================================================
timeout /t 1 /nobreak >nul
@echo.
@echo.
echo ³ “¤ «¥­¨¥ ¡¥ª ¯ ...                                     ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-json%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-data%.old" >nul 2>&1
				 
				 
echo º! ‘ªà¨¯â Extras-addon “‘‹Ž‚Ž ãá¯¥è­® ãáâ ­®¢«¥­.     ! º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-Addon%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-json%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo  ‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î ç¥à¥§ 10 á¥ª...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 
					 
					 
:download_ultimate_menu_RU
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º        “áâ ­®¢ª  UltimateMenu ¨§ à¥¯®§¨â®à¨ï          º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul
echo ³ “¤ «¥­¨¥ áâ àëå OLD ¡¥ª ¯®¢...                       ° ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UltimateMenu%.old" >nul 2>&1


if exist "%/Scripts%\%name_UltimateMenu%" (

  echo ³ Ž¡­ àã¦¥­ UltimateMenu.lua. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_UltimateMenu%" %name_UltimateMenu%.old

  echo ³ ¥ª ¯ á®§¤ ­. ‡ £àã§ª  Extras-Addon...                 ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  
  powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenuUrl%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "
  
) else (

echo ³ Extras-Addon.lua ­¥ ®¡­ àã¦¥­. —¨áâ ï ãáâ ­®¢ª ...    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
del "%/Scripts%\%name_UltimateMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenuUrl%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "

timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_UltimateMenu%" (

timeout /t 1 /nobreak >nul
echo ³ UltimateMenu.lua ãá¯¥è­® § £àã¦¥­.                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	             
timeout /t 1 /nobreak >nul
echo ³  “¤ «¥­¨¥ ¡¥ª ¯ ...                                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UltimateMenu%.old" >nul 2>&1
				 
				 
echo º ‘ªà¨¯â UltimateMenu ãá¯¥è­® ãáâ ­®¢«¥­.               º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?  ’ãâ: %/Scripts%\%name_UltimateMenu%"
echo ----------------------------------------------------------
echo  ‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î ç¥à¥§ 10 á¥ª...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 

	) else (
	
	echo ³ ! ERROR: ¥ ã¤ «®áì áª ç âì ä ©« UltimateMenu.lua    ! ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

    timeout /t 2 /nobreak >nul	
	echo ³ ! ‚®ááâ ­®¢«¥­¨¥ ¡¥ª ¯ ...                           ! ³
    echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_UltimateMenu%" >nul 2>&1
    rename "%/Scripts%\%name_UltimateMenu%.old" %name_UltimateMenu%

    @echo.
    echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
    echo º !                     ‚ˆŒ€ˆ…                       ! º
    echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
    echo º  ¥ª ¯ ¢®ááâ ­®¢«¥­. ‡ £àã§ª  ­®¢ëå ä ©«®¢ … “„€‹€‘œ  º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
	@echo.
    echo ----------------------------------------------------------
    echo à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì 
    echo  ááë«ª¨ ­  ä ©« ¢ ª®¤¥.
    echo ----------------------------------------------------------
    echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	    )

	
:download_yimmenu_RU
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º       ‡ £àã§ª  ­®¢®© ¢¥àá¨¨ YimMenu ¨§ à¥¯®§¨â®à¨ï   º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul
echo ³ “¤ «¥­¨¥ áâ àëå OLD ¡¥ª ¯®¢...                       ° ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YimMenu%.old" >nul 2>&1

if exist "%/Downloads%\%name_YimMenu%" (

  echo ³ Ž¡­ àã¦¥­ %name_YimMenu%. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...    ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/Downloads%\%name_YimMenu%" %name_YimMenu%.old

  echo ³ ¥ª ¯ á®§¤ ­. ‡ £àã§ª  YimMenu...                      ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

  powershell -command "& { Invoke-WebRequest -Uri '%YimMenuUrl%' -OutFile '%/Downloads%\%name_YimMenu%' }"
	
) else (

echo ³ YimMenu.dll ­¥ ®¡­ àã¦¥­.      —¨áâ ï ãáâ ­®¢ª ...    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
del "%/Downloads%\%name_YimMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%YimMenuUrl%' -OutFile '%/Downloads%\%name_YimMenu%' }"

timeout /t 3 /nobreak >nul )

if exist "%/Downloads%\%name_YimMenu%" (

timeout /t 1 /nobreak >nul
echo ³ YimMenu.dll ãá¯¥è­® § £àã¦¥­.                         ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	             
timeout /t 1 /nobreak >nul
echo ³  “¤ «¥­¨¥ ¡¥ª ¯ ...                                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YimMenu%.old" >nul 2>&1
				 
				 
echo º —¨â-¬¥­î  YimMenu ãá¯¥è­® ãáâ ­®¢«¥­.                 º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?  ’ãâ: %/Downloads%\%name_YimMenu%"
echo ----------------------------------------------------------
echo  ‚ëå®¤ ¢ £« ¢­®¥ ¬¥­î ç¥à¥§ 10 á¥ª...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 

) else (

    echo ³ ! ERROR: ¥ ã¤ «®áì áª ç âì ä ©« YimMenu.dll         ! ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

    timeout /t 2 /nobreak >nul	
	echo ³ ! ‚®ááâ ­®¢«¥­¨¥ ¡¥ª ¯ ...                           ! ³
    echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    timeout /t 1 /nobreak >nul
    del "%/Downloads%\%name_YimMenu%" >nul 2>&1
    rename "%/Downloads%\%name_YimMenu%.old" %name_YimMenu%

    @echo.
    echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
    echo º !                     ‚ˆŒ€ˆ…                       ! º
    echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
    echo º  ¥ª ¯ ¢®ááâ ­®¢«¥­. ‡ £àã§ª  ­®¢ëå ä ©«®¢ … “„€‹€‘œ  º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
	@echo.
    echo ----------------------------------------------------------
    echo à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì 
    echo  ááë«ª¨ ­  ä ©« ¢ ª®¤¥.
    echo ----------------------------------------------------------
    echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	    )


:download_fate_injector_RU
cls
echo ------------------------------------------------------------------
echo 	‘ª ç âì ¨­¦¥ªâ®à FateInjector ¨§ à¥¯®§¨â®à¨ï 
echo ------------------------------------------------------------------
echo "à®¢¥àª  ­ «¨ç¨ï FateInjector.exe ¢ ¯ ¯ª¥ ‡ £àã§ª¨ ¨«¨ ­  à ¡®ç¥¬ áâ®«¥ ..."
timeout /t 1 /nobreak >nul
cls

if exist "%/Downloads%\%name_FateInjector%" (
 echo " ©¤¥­ FateInjector, ‚ ¬ ­¥ ­ã¦­® áª ç¨¢ âì ¥£® á­®¢ ."
 timeout /t 1 /nobreak >nul
 goto quest_start_Fateinjector_RU
 ) else (
   echo "‡ £àã§ª  FateInjector ..."
   powershell -command "& { Invoke-WebRequest -Uri '%FateInjectorUrl%' -OutFile '%/Downloads%\%name_FateInjector%' }"
   if not exist "%/Downloads%\%name_FateInjector%" (
    echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« %name_FateInjector%. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ."
    ) else (
      cls
      echo "FateInjector ãá¯¥è­® § £àã¦¥­. "
	  echo "ƒ¤¥ ä ©«?   ’ãâ: %/Downloads%\%name_FateInjector%"
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

if exist "%/Downloads%\%name_Xenos%" (
echo "  ©¤¥­ Xenos64, ‚ ¬ ­¥ ­ã¦­® áª ç¨¢ âì ¥£® á­®¢ ."
timeout /t 2 /nobreak >nul
goto quest_start_Xenos_RU
) else (
  echo "‡ £àã§ª  Xenos64 ..."
  powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\%name_Xenos%' }"
  if not exist "%/Downloads%\%name_Xenos%" (
  echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« %name_Xenos%. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥."
  ) else (
    cls
    echo "Xenos64 Injector downloaded successfully. "
	@echo.
	echo "File Location: %/Downloads%\%name_Xenos%"
	timeout /t 1 /nobreak >nul )
	goto quest_start_Xenos_RU
	)

:quest_start_Xenos_RU
cls
set /p yn=•®â¨â¥ § ¯ãáâ¨âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à %name_Xenos%? (Y/N): 
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
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º  ‚ë¡¥à¨â¥ áªà¨¯â- ¤¤®­ ¤«ï ãáâ ­®¢ª¨. (to /scripts)  º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo ³ [1]  Extras-Addon                                    1 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ [2]  Ultimate-Menu                                   2 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo [3]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
echo ----------------------------------------------------------
echo [4] ß Žâªàëâì ¯ ¯ªã /scripts. ’ ¬ áªà¨¯âë-¤®¯®«­¥­¨ï.

choice /c 1234 /n
 if errorlevel 4 goto open_scripts_folder_RU
 if errorlevel 3 goto menu_RU
 if errorlevel 2 goto check_yimmenu_U_RU
 if errorlevel 1 goto check_yimmenu_E_RU


:optional_downloads_RU
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º          §«¨ç­ë¥ ¯«îèª¨                             º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo ³ 1  Get XML Maps/Vehicles (Opens in Browser)          1 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 2  Download Animations Dictionary (Yim root folder)  2 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 3  “¯à ¢«¥­¨¥ ­ áâà®©ª ¬¨ YimMenu (settings.json)    3 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo [4]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
echo ----------------------------------------------------------
echo [5] ß Žâªàëâì ¯ ¯ªã /YimMenu. Š®à­¥¢ ï ¯ ¯ª  ç¨â-¬¥­î.

choice /c 12345 /n
 if errorlevel 5 goto open_YimMenu_folder_RU
 if errorlevel 4 goto menu_RU
 if errorlevel 3 goto choice_settings_RU
 if errorlevel 2 goto download_animDictsCompact_RU
 if errorlevel 1 goto download_XML_Maps_RU

:download_XML_Maps_RU
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ Žâªàëâ¨¥ ááë«ª¨ MagicModz89's MEGA ¢ ¡à ã§¥à¥...                  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 1 /nobreak >nul
start "XML Maps" "%XML_mapsUrl%"

:: cscript //nologo BringToFront.vbs
:xml_info
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ —â®¡ë ¨á¯®«ì§®¢ âì ¨å, § £àã§¨â¥ ä ©« ¢ ä®à¬ â¥ zip               ³
echo ³  ¨ ¨§¢«¥ª¨â¥ á®®â¢¥âáâ¢ãîé¥¥ á®¤¥à¦¨¬®¥ ¯® ¯ãâ¨:                  ³
echo ³-------------------------------------------------------------------³
echo ³  %/YimMenu%\xml_maps and xml_vehicles ³ 
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo ---------------------------------------------------------------------
echo [1]  ‚ë©â¨ ¢ ¬¥­î ¤®¯ ¯«îè¥ª.
echo [2] ß Žâªàëâì ¯ ¯ªã /xml_maps and xml_vehicles.
choice /c 12 /n
 if errorlevel 2 goto open_xml_folder_RU
 if errorlevel 1 goto optional_downloads_RU
 

:download_animDictsCompact_RU
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º    ‡ £àã§ª  ¡ §ë ¤ ­­ëå  ­¨¬ æ¨© ¨§ à¥¯®§¨â®à¨ï      º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul
echo ³ “¤ «¥­¨¥ áâ àëå OLD ¡¥ª ¯®¢...                       ° ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_animDictsCompact%.old" >nul 2>&1

if exist "%/YimMenu%\%name_animDictsCompact%" (

  echo ³ Ž¡­ àã¦¥­ animDictsCompact. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/YimMenu%\%name_animDictsCompact%" %name_animDictsCompact%.old

  echo ³ ¥ª ¯ á®§¤ ­. ‡ £àã§ª  animDictsCompact...             ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  
powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

) else (

echo ³ animDictsCompact ­¥ ®¡­ àã¦¥­.   —¨áâ ï ãáâ ­®¢ª ...  ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
del "%/YimMenu%\%name_animDictsCompact%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

timeout /t 3 /nobreak >nul )

if exist "%/YimMenu%\%name_animDictsCompact%" (

timeout /t 1 /nobreak >nul
echo ³ animDictsCompact ãá¯¥è­® § £àã¦¥­.                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	             
timeout /t 1 /nobreak >nul
echo ³  “¤ «¥­¨¥ ¡¥ª ¯ ...                                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_animDictsCompact%.old" >nul 2>&1
				 
				 
echo º  §  ¤ ­­ëå  ­¨¬ æ¨© ãá¯¥è­® ãáâ ­®¢«¥­ .             º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?  ’ãâ: %/YimMenu%/%name_animDictsCompact%"
echo ----------------------------------------------------------
echo  ‚ëå®¤ ¢ ¬¥­î ¤®¯ ¯«îè¥ª ç¥à¥§ 5 á¥ª...
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_RU

) else (

    echo ³ ! ERROR: ¥ ã¤ «®áì áª ç âì animDictsCompact         ! ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

    timeout /t 2 /nobreak >nul	
	echo ³ ! ‚®ááâ ­®¢«¥­¨¥ ¡¥ª ¯ ...                           ! ³
    echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    timeout /t 1 /nobreak >nul
    del "%/YimMenu%\%name_animDictsCompact%" >nul 2>&1
    rename "%/YimMenu%\%name_animDictsCompact%.old" %name_animDictsCompact%

    @echo.
    echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
    echo º !                     ‚ˆŒ€ˆ…                       ! º
    echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
    echo º  ¥ª ¯ ¢®ááâ ­®¢«¥­. ‡ £àã§ª  ­®¢ëå ä ©«®¢ … “„€‹€‘œ  º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
	@echo.
    echo ----------------------------------------------------------
    echo à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì 
    echo  ááë«ª¨ ­  ä ©« ¢ ª®¤¥.
    echo ----------------------------------------------------------
    echo [1]  ‚ë©â¨ ¢ ¬¥­î ¤®¯ ¯«îè¥ª
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	)


:choice_settings_RU

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º    “¯à ¢«¥­¨¥ ­ áâà®©ª ¬¨ YimMenu (Settings.json)    º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo ³ [1] “áâ ­®¢¨âì ª áâ®¬­ë¥ ­ áâà®©ª¨ ®â  ¢â®à  YimTools  ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ [2] ‚®ááâ ­®¢¨âì á¢®¨ à ­¥¥ áãé¥áâ¢®¢ ¢è¨¥ ­ áâà®©ª¨   ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo [3]  ‚ë©â¨ ¢ ¬¥­î ¤®¯ ¯«îè¥ª.

choice /c 123 /n
 if errorlevel 3 goto optional_downloads_RU
 if errorlevel 2 goto restore_settings_RU
 if errorlevel 1 goto import_settings_RU


:import_settings_RU
cls
echo ------------------------------------------------------------------
echo 	Š áâ®¬­ë¥ ­ áâà®©ª¨ settings.json ¤«ï ç¨â ¬¥­î YimMenu 
echo ------------------------------------------------------------------
echo " à®¢¥àª  ­ «¨ç¨ï ã¦¥ áãé¥áâ¢ãîé¥£® ä ©«  ­ áâà®¥ª... "

if exist "%/YimMenu%/%name_YimMenu-settings%" (

echo "¥ª ¯ ã¦¥ áãé¥áâ¢ãîé¨å ­ áâà®¥ª settings.json ..."
timeout /t 2 /nobreak >nul
rename "%/YimMenu%\%name_YimMenu-settings%" %name_YimMenu-settings%.old
timeout /t 1 /nobreak >nul
goto dwn_settings_noexist
) else (
:dwn_settings_noexist
echo "“áâ ­®¢ª  ª áâ®¬­®£® settings.json ®â  ¢â®à  YimTools..."
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YimMenu-settings%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%settingsUrl%' -OutFile '%/YimMenu%/%name_YimMenu-settings%' }"

if not exist "%/YimMenu%/%name_YimMenu-settings%" (
		echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« %name_YimMenu-settings%. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥."
	) else (
	    cls
		echo "Š áâ®¬­ë¥ ­ áâà®©ª¨ ãá¯¥è­® ãáâ ­®¢«¥­ë. "
		echo "ƒ¤¥ ä ©«? ’ãâ: %/YimMenu%/%name_YimMenu-settings%"
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
if exist "%/YimMenu%/%name_YimMenu-settings%.old" (
echo " ‚ë¯®«­ï¥âáï ¢®ááâ ­®¢«¥­¨¥ ä ©«  settigs.json... "
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YimMenu-settings%" >nul 2>&1
rename "%/YimMenu%\%name_YimMenu-settings%.old" %name_YimMenu-settings%
echo " ‚®ááâ ­®¢«¥­¨¥ ä ©«  %name_YimMenu-settings% ¯à®è«® “‘…˜Ž "
timeout /t 2 /nobreak >nul
goto menu_RU
) else (
cls
echo " íª ¯ ä ©«  %name_YimMenu-settings% … €‰„… "
timeout /t 3 /nobreak >nul
goto menu_RU )

:: //////////////////////////////////////////////////////////////////////
:: \\\\\\\\\\\\\ \\\\\\\\\\\ astions link \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
:: /////////////////////////////////////////////////////////////////////

:open_scripts_folder_RU
start %/Scripts%
goto choice_addons_RU

:open_YimMenu_folder_RU
start %/YimMenu%
goto optional_downloads_RU

:open_xml_folder_RU
start %/YimMenu%\xml_maps
start %/YimMenu%\xml_vehicles
cls
goto xml_info

:restart_RU
echo "‡ ¯ãáª ­®¢®© ¢¥àá¨¨ YimTools ..."
timeout /t 2 /nobreak >nul
start YimTools_alfa.exe
exit

:start_Xenos_RU

cls
echo ‡ ¯ãáª ¯à®£à ¬¬ë-¨­¦¥ªâ®à  Xenos ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\%name_Xenos%
:: start Xenos64.exe
exit

:start_instructions_Xenos
cls
echo § ¯ãáª â¥ªáâ®¢®© ¨­áâàãªæ¨¨ ¨­¦¥ªâ  YimMenu
start "" %/Downloads%\%name_Xenos-instructions%
exit

:start_FateInjector_RU

cls
echo ‡ ¯ãáª ¯à®£à ¬¬ë-¨­¦¥ªâ®à  FateInjector ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\%name_FateInjector%
:: FateInjector.exe
exit

:here_nothing_now
cls
echo ’ãâ ¯®ª  çâ® ­¨ç¥£® ­¥âã, ¢®§¬®¦­® ¢ ¡ã¤ãé¥¬
echo ¯®ï¢¨âáï ª ª ï-­¨¡ã¤ì ­®¢ ï äã­ªæ¨ï...
timeout /t 2 /nobreak >nul
goto menu_RU

:goodbye_RU
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ ~        ‘¯ á¨¡® §  ¨á¯®«ì§®¢ ­¨¥ YimTools,       ~ ³
echo ³ ~                à¨ïâ­®© ¨£àë!                   ~ ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 2 /nobreak >nul
exit

:exit_RU
echo ‚ëå®¤ ...
exit /b


:auto_mode_RU
cls
goto menu_RU
:: ------------- YimMenu -------------------------------



:: ------------- Xenos64 -------------------------------


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
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � ?      Choice language  / �襦ム�皀 錻覈              ? �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
echo � 1  English                                           1 �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
echo � 2  �竅瓷┤                                           2 �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
echo [3]  Exit / �諷��

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
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � 1                   Start GTA 5                      1 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
echo �  Wait until it fully loads into story mode or online.  �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

timeout /t 3 /nobreak >nul
@echo.
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � 2           Open your preferred injector             2 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
echo �     and find/select YimMenu.dll file.                  �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

timeout /t 3 /nobreak >nul
@echo.
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � 3           Select the process (gta5.exe)            3 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
echo �     inject the cheat by pressing the INJECT button.    �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

timeout /t 3 /nobreak >nul
@echo.
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � 4        Once YimMenu is injected open GTA.          4 �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

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
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo �   蹍▲爲� ����腮� ��〓� ▲珀┬ %name_YimTools%...             �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
timeout /t 1 /nobreak >nul

powershell -command "& { Invoke-WebRequest -Uri '%updateScriptUrl%' -OutFile '%scriptFolder%%name_dwn_YimTools%' }"

:: Compare the current script with the updated version
fc "%scriptFolder%%name_dwn_YimTools%" "%scriptFolder%%name_YimTools%" >nul
 if errorlevel 1 (
 
    echo � ｡��←キ┘ ���ぅ��! ���珮И� ��〓� ▲珀┬ %name_YimTools% ...    �
    echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
	
	rename "%scriptFolder%%name_dwn_YimTools%" %name_YimTools%
    ::move /y "%scriptFolder%%name_YimTools%.new" "%scriptFolder%%name_YimTools%" >nul
	::del "%scriptFolder%%name_YimTools%.new" >nul 2>&1s
	
    echo �            蹍������ 竅�ヨ�� �´�←キ�!                          �
    echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
    echo ----------------------------------------------------------------------
    echo �オ竕�� ▲珀��: %YimTools_version%
	echo [~]  �ムェ��竅�.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (

    del "%scriptFolder%%name_dwn_YimTools%" >nul 2>&1s
	
    echo �            � ��� 礒� ����� ����� ▲珀��                          �
    echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
    echo ----------------------------------------------------------------------
    echo �オ竕�� ▲珀��: %YimTools_version%
    timeout /t 1 /nobreak >nul
    goto menu_RU
)


	
:: Continue with the main script

:menu_RU

cls
echo 敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo �                     YimTools exe edition                          �
echo �                                                                   �
echo �                   �ム瓱� 瓷爬���: %YimTools_version%                    �
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�

echo ---------------------------------------------------------------------
echo   ��� �牀������ 祚牀痰�� �牀罐瘁 瓷�腮����� 瓣ウ�� ▲珀┤ YimMenu,
echo   瓷爬�皰� � �ガ� � 〓К�Ν� む磽�� �爬閧�諷 ��鉞オ. 
echo                   ~ ���讌礬皀瘡 � 磴�〓�赱癶┘� ~
echo ---------------------------------------------------------------------
timeout /t 2 /nobreak >nul
@echo.

echo ---------------------------------------------------------------------
echo 			���↓�� �キ�
echo ---------------------------------------------------------------------
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo � ?           �襦ム� 艪� 絎腑蓐 瓩カ�碎                           ? �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � 1 �����碎 �牀������-┃Ε�皰�                                    1 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � 2 �����碎 腮� �キ� YimMenu                                      2 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � 3 �痰���※碎 ぎ����キ��-瓷爬�硅 か� YimMenu                     3 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � 4 �腮痰�碎 ����� �ヨ� YimMenu (°痰琺� 筥�� ��甄� �´��� GTA V) 4 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � 5 �������皀�讚襯 ��鉞��                                         5 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � 6                                                               6 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � 7             \\ ��� �キ�, 瓩カ��瘴 ≡� ���� //                  �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo [8] ��痰珮�罔� �� ���竅�� 腮��.
echo [9] �覃皋 ├ �牀������.
echo ---------------------------------------------------------------------
echo 敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳朕
echo � �甄� ����� ���珮М� ��絎え矚� �� � �礒��� �メ皀 ┼� ヱ �モ�,   �
echo �  皰��� �� 祠������� ���珮И� ＜ゃ� �� ��｀腑� 痰���.           �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰

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
echo 	  ��� 竅����※碎/�甎��讌���碎 腮� �キ� YimMenu
echo ------------------------------------------------------------------
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � 1                   ���竅皋皀 GTA 5                  1 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
echo � ��Δ�皀瘡 ������ ���珮И� � 瘤Ε皚覃 爛Θ� ┼� ������. �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

timeout /t 3 /nobreak >nul
@echo.
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � 2            ���竅皋皀 �牀������ ┃Ε�皰�            2 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
echo �  � �襦ム�皀 ���� YimMenu.dll か� ┃Ε��� � ┌珮        �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

timeout /t 2 /nobreak >nul
@echo.
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � 3     �襦ム�皀 礒� ���竕キ�覃 �牀罐瘁 (gta5.exe)     3 �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
echo �  ��甄� 腑�� �覩����皀 ┃Ε�� 腮�� ����� ������ INJECT  �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

timeout /t 2 /nobreak >nul
@echo.
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � 4        ��甄� ┃Ε��� ���え皀 � GTA V.              4 �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

timeout /t 2 /nobreak >nul
@echo.
echo    ______                                    ______
echo   /_____/ �甄� ≡� �牀茫� 竅�ヨ��, � ┌爛   /_____/
echo  /_____/ ぎ�Ν� �皰÷�Ж碎瘴 ���� YimMenu. /_____/

timeout /t 2 /nobreak >nul
@echo.
echo -------------------------------------------------------------------
echo -------------------------------------------------------------------
echo  =  ��� �皖琺皋�/���琺皋� 腮�-�キ� ��Μ�皀 ���※蓊 INSERT.
echo  =  �皰° �´�※碎 �ヨ ���え皀 � ��痰牀��� 腮�-�キ� � ��Μ�皀 ������ �������� ���/Update Cache.
echo  =  ��� 瓷琺皋� ���� 腮�� � �ア�� ▲璢�ガ 磽�� 
echo      �牀�え皀 � ��痰牀���: Settings - GUI � 磧ム�皀 ����腦� � �祗��� Show Overlay 
@echo.
@echo.
echo ===================================================================
echo [1] ��Μ�皀 1 か� �諷��� � ���↓�� �キ� ...

timeout /t 1 /nobreak >nul

choice /c 1 /n
 if errorlevel 1 goto menu_RU
 
 

:choice_injectors_RU

cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo �         �����碎 �牀������-┃Ε�皰�                   �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
echo � 1  Xenos                                             1 �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
echo � 2  Fate_Injector                                     2 �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
echo [3]  �覃皋 � ���↓�� �キ�.

choice /c 123 /n
 if errorlevel 3 goto menu_RU
 if errorlevel 2 goto download_fate_injector_RU
 if errorlevel 1 goto download_xenos_RU

:check_yimmenu_E_RU

cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � ?        �甎��讌�����-�� �� YimMenu ���ゥ? (Y/N)     ? �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

set /p yn= ��Μ�皀 Y � 甄竍�� ����Θ皀�讚��� �癶モ�: 
if /i "%yn%"=="Y" (
goto download_extras_addon_RU
) else (
    cls
    echo "�����礬痰� 甅����� ���珮Ж皀 � ���竅皋皀 YimMenu �ムイ ���珮И�� Extras Addon."
    echo "��甄� ���竅�� YimMenu, �� ��Ε皀 ▲爿竄赱� � 轤�� �祗�� � ���珮Ж碎 Extras Addon."
    echo "��� ���竅�� YimMenu ��� �ギ≦�え�� ���珮Ж碎 �牀������-┃Ε�皰� FateInjector, Xenos � ┃襯."
	echo ------------------------------------------------------------------
	echo "�ムイ ���竅��� YimMenu ���珮Ж皀瘡 � 瘤Ε皚覃 爛Θ� ┼� ������."
	echo "�甄� �� �� Л�モ�, ��� �甎��讌���碎 YimMenu, ��Μ�皀 6 � ���↓�� �キ�, 艪�° ���竍�碎 ┃痰珮�罔�."
	echo ------------------------------------------------------------------
	echo "�諷�� � ���↓�� �キ� (15瓮�)."
    timeout /t 15 /nobreak >nul
    cls
    goto menu_RU
	)
	
:check_yimmenu_U_RU

cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo � ?        �甎��讌�����-�� �� YimMenu ���ゥ? (Y/N)     ? �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕

set /p yn= ��Μ�皀 Y � 甄竍�� ����Θ皀�讚��� �癶モ�: 
if /i "%yn%"=="Y" (
 goto download_ultimate_menu_RU
 ) else (
	cls
    echo "�����礬痰� 甅����� ���珮Ж皀 � ���竅皋皀 YimMenu �ムイ ���珮И�� Extras Addon."
    echo "��甄� ���竅�� YimMenu, �� ��Ε皀 ▲爿竄赱� � 轤�� �祗�� � ���珮Ж碎 Extras Addon."
    echo "��� ���竅�� YimMenu ��� �ギ≦�え�� ���珮Ж碎 �牀������-┃Ε�皰� FateInjector, Xenos � ┃襯."
	echo ------------------------------------------------------------------
	echo "�ムイ ���竅��� YimMenu ���珮Ж皀瘡 � 瘤Ε皚覃 爛Θ� ┼� ������."
	echo "�甄� �� �� Л�モ�, ��� �甎��讌���碎 YimMenu, ��Μ�皀 6 � ���↓�� �キ�, 艪�° ���竍�碎 ┃痰珮�罔�."
	echo ------------------------------------------------------------------
	echo "�諷�� � ���↓�� �キ� (15瓮�)."
	timeout /t 15 /nobreak >nul
	cls
	goto menu_RU
    )

:delete_cache_folder_RU

cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo � !                         ��������                              ! �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo �    ����キ┘ �ヨ� YimMenu �ギ≦�え�� ������ メ�� �� �´�※��       �
echo �     YimMenu.dll, �� 瓠�� ≡� ラ� �牀�痳�わ�.                      �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
timeout /t 2 /nobreak >nul
echo � �覩���錺矚� �砒�痰�� �ヨ�...                                      �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
timeout /t 2 /nobreak >nul
rmdir /s /q "%/YimMenu%\cache"
echo � �ヨ °� 竅�ヨ�� �腮薀�.                                           �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
timeout /t 1 /nobreak >nul
echo �  �諷�� � ���↓�� �キ� .                                           �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo ---------------------------------------------------------------------
echo 敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � �甄� 轤� �� 爛荐� �牀゛ガ�, �牀▲瑕皀 痰����聶 �牀゛ガ �� GitHub  �
echo �  �� �むメ� https://github.com/YimMenu/YimMenu/issues .            �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�

timeout /t 3 /nobreak >nul
cls

echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo � !                         ��������                              ! �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo �    ����キ┘ �ヨ� YimMenu �ギ≦�え�� ������ メ�� �� �´�※��       �
echo �     YimMenu.dll, �� 瓠�� ≡� ラ� �牀�痳�わ�.                      �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo � �覩���錺矚� �砒�痰�� �ヨ�...                                      �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � �ヨ °� 竅�ヨ�� �腮薀�.                                           �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo �  �諷�� � ���↓�� �キ� ..                                         �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo ---------------------------------------------------------------------
echo 敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � �甄� 轤� �� 爛荐� �牀゛ガ�, �牀▲瑕皀 痰����聶 �牀゛ガ �� GitHub  �
echo �  �� �むメ� https://github.com/YimMenu/YimMenu/issues .            �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�

timeout /t 6 /nobreak >nul
cls

echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo � !                         ��������                              ! �
echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo �    ����キ┘ �ヨ� YimMenu �ギ≦�え�� ������ メ�� �� �´�※��       �
echo �     YimMenu.dll, �� 瓠�� ≡� ラ� �牀�痳�わ�.                      �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo � �覩���錺矚� �砒�痰�� �ヨ�...                                      �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � �ヨ °� 竅�ヨ�� �腮薀�.                                           �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo �  �諷�� � ���↓�� �キ� ...                                        �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo ---------------------------------------------------------------------
echo 敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � �甄� 轤� �� 爛荐� �牀゛ガ�, �牀▲瑕皀 痰����聶 �牀゛ガ �� GitHub  �
echo �  �� �むメ� https://github.com/YimMenu/YimMenu/issues .            �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�

timeout /t 1 /nobreak >nul
goto menu_RU

:download_extras_addon_RU
cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo �        �痰���→�  Extras Addon ├ 爛��Ж皰爬�          �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
timeout /t 1 /nobreak >nul
echo � ����キ┘ 痰�琺� OLD ．�����...                       � �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-json%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-data%.old" >nul 2>&1

timeout /t 1 /nobreak >nul


if exist "%/Scripts%\%name_Extras-Addon%" (

  echo � ｡��珮Ε� Extras-Addon.lua. ��Г��┘ ��〓�� ．����...  �
  echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_Extras-Addon%" %name_Extras-Addon%.old
  rename "%/Scripts%\%name_Extras-json%" %name_Extras-json%.old
  rename "%/Scripts%\%name_Extras-data%" %name_Extras-data%.old
  
  echo � �オ�� 甌Г��. �痰���→� Extras-Addon...                �
  echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
  
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-AddonUrl%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-JsonUrl%' -OutFile '%/Scripts%\%name_Extras-json%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-DataUrl%' -OutFile '%/Scripts%\%name_Extras-data%' }"
  
) else (
	  
    echo � Extras-Addon.lua �� �´�珮Ε�. ��痰�� 竅����→�...     �
    echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	  
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
	echo � ! ERROR: �� 磴���瘡 瓷���碎 ���� json.lua            ! �
    echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	timeout /t 2 /nobreak >nul
	              
	echo � ! ��瘁����←キ┘ ．����...                           ! �
    echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1
	del "%/Scripts%\%name_Extras-json%" >nul 2>&1
    del "%/Scripts%\%name_Extras-data%" >nul 2>&1
	
    rename "%/Scripts%\%name_Extras-Addon%.old" %name_Extras-Addon%
    rename "%/Scripts%\%name_Extras-json%.old" %name_Extras-json%
    rename "%/Scripts%\%name_Extras-data%.old" %name_Extras-data%
    timeout /t 1 /nobreak >nul
    @echo.
    echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
    echo � !                     ��������                       ! �
    echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
    echo �  �オ�� 〓瘁����←キ. ���珮И� ���諷 ������ �� �������  �
    echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
	@echo.
    echo ----------------------------------------------------------
    echo 蹍▲瑕皀 ����腮� ┃皀爿モ 甌イ┃キ�� ┼� ��矣��讚�痰� 
    echo  瘁覊�� �� ���� � ��ぅ.
    echo ----------------------------------------------------------
    echo [1]  �覃皋 � ���↓�� �キ�.
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	    )
				  
) else (

  echo � ! ERROR: �� 磴���瘡 瓷���碎 ���� Extras-Addon.lua    ! �
  echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
  timeout /t 2 /nobreak >nul
  
  echo � ! ��瘁����←キ┘ ．����...                           ! �
  echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
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
  echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
  echo � !                     ��������                       ! �
  echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
  echo �  �オ�� 〓瘁����←キ. ���珮И� ���諷 ������ �� �������  �
  echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
  @echo.
  echo ----------------------------------------------------------
  echo 蹍▲瑕皀 ����腮� ┃皀爿モ 甌イ┃キ�� ┼� ��矣��讚�痰� 
  echo  瘁覊�� �� ���� � ��ぅ.
  echo ----------------------------------------------------------
  echo [1]  �覃皋 � ���↓�� �キ�.
  choice /c 1 /n
  if errorlevel 1 goto menu_RU
       )
		
:continue_dwn_extras_addon
					   
if exist "%/Scripts%\%name_Extras-data%" (
  goto download_extras_addon_RU_Success 
  
  ) else (
	echo � ! ERROR: �� 磴���瘡 瓷���碎 ���� Extras-data.lua     ! �
    echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	timeout /t 1 /nobreak >nul
						
	echo � ! ��瘁����←キ┘ %name_Extras-data%...               ! �
    echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
	@echo.
	rename "%/Scripts%\%name_Extras-data%.old" %name_Extras-data%
    timeout /t 2 /nobreak >nul
	goto download_extras_addon_RU_Success_Data_Notice )
				  	  
:download_extras_addon_RU_Success
	             
echo � Extras-addon.lua 竅�ヨ�� ���珮Ε�.                    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
				 
timeout /t 1 /nobreak >nul
echo � Json.lua 竅�ヨ�� ���珮Ε�.                            �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	             
timeout /t 1 /nobreak >nul
echo � Extras-data.lua 竅�ヨ�� ���珮Ε�.                     �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	             
timeout /t 1 /nobreak >nul

echo �  ����キ┘ ．����...                                    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-json%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-data%.old" >nul 2>&1
				 
				 
echo � ��爬�� Extras-addon 竅�ヨ�� 竅����←キ.               �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "�ぅ ����?   �竄: %/Scripts%\%name_Extras-Addon%"
echo "�ぅ ����?   �竄: %/Scripts%\%name_Extras-json%"
echo "�ぅ ����?   �竄: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo  �諷�� � ���↓�� �キ� 腑爛� 10 瓮�...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 
				               

:download_extras_addon_RU_Success_Data_Notice
	             
echo � Extras-addon.lua 竅�ヨ�� ���珮Ε�.                    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
@echo.
@echo.
				 
timeout /t 1 /nobreak >nul
echo � Json.lua 竅�ヨ�� ���珮Ε�.                            �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
@echo.
@echo.
	             
timeout /t 1 /nobreak >nul
echo � Extras-data.lua 〓瘁����←キ. ���珮И� �� 磴���瘡   ! �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
@echo.
@echo.
	             
echo ==================================================
timeout /t 1 /nobreak >nul
@echo.
@echo.
echo � ����キ┘ ．����...                                     �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-json%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-data%.old" >nul 2>&1
				 
				 
echo �! ��爬�� Extras-addon ������� 竅�ヨ�� 竅����←キ.     ! �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "�ぅ ����?   �竄: %/Scripts%\%name_Extras-Addon%"
echo "�ぅ ����?   �竄: %/Scripts%\%name_Extras-json%"
echo "�ぅ ����?   �竄: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo  �諷�� � ���↓�� �キ� 腑爛� 10 瓮�...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 
					 
					 
:download_ultimate_menu_RU
cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo �        �痰���→� UltimateMenu ├ 爛��Ж皰爬�          �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
timeout /t 1 /nobreak >nul
echo � ����キ┘ 痰�琺� OLD ．�����...                       � �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UltimateMenu%.old" >nul 2>&1


if exist "%/Scripts%\%name_UltimateMenu%" (

  echo � ｡��珮Ε� UltimateMenu.lua. ��Г��┘ ��〓�� ．����...  �
  echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_UltimateMenu%" %name_UltimateMenu%.old

  echo � �オ�� 甌Г��. ���珮И� Extras-Addon...                 �
  echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
  
  powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenuUrl%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "
  
) else (

echo � Extras-Addon.lua �� �´�珮Ε�. ��痰�� 竅����→�...    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	  
del "%/Scripts%\%name_UltimateMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenuUrl%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "

timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_UltimateMenu%" (

timeout /t 1 /nobreak >nul
echo � UltimateMenu.lua 竅�ヨ�� ���珮Ε�.                    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	             
timeout /t 1 /nobreak >nul
echo �  ����キ┘ ．����...                                    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調

timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UltimateMenu%.old" >nul 2>&1
				 
				 
echo � ��爬�� UltimateMenu 竅�ヨ�� 竅����←キ.               �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "�ぅ ����?  �竄: %/Scripts%\%name_UltimateMenu%"
echo ----------------------------------------------------------
echo  �諷�� � ���↓�� �キ� 腑爛� 10 瓮�...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 

	) else (
	
	echo � ! ERROR: �� 磴���瘡 瓷���碎 ���� UltimateMenu.lua    ! �
    echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調

    timeout /t 2 /nobreak >nul	
	echo � ! ��瘁����←キ┘ ．����...                           ! �
    echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_UltimateMenu%" >nul 2>&1
    rename "%/Scripts%\%name_UltimateMenu%.old" %name_UltimateMenu%

    @echo.
    echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
    echo � !                     ��������                       ! �
    echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
    echo �  �オ�� 〓瘁����←キ. ���珮И� ���諷 ������ �� �������  �
    echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
	@echo.
    echo ----------------------------------------------------------
    echo 蹍▲瑕皀 ����腮� ┃皀爿モ 甌イ┃キ�� ┼� ��矣��讚�痰� 
    echo  瘁覊�� �� ���� � ��ぅ.
    echo ----------------------------------------------------------
    echo [1]  �覃皋 � ���↓�� �キ�.
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	    )

	
:download_yimmenu_RU
cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo �       ���珮И� ��〓� ▲珀┬ YimMenu ├ 爛��Ж皰爬�   �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
timeout /t 1 /nobreak >nul
echo � ����キ┘ 痰�琺� OLD ．�����...                       � �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YimMenu%.old" >nul 2>&1

if exist "%/Downloads%\%name_YimMenu%" (

  echo � ｡��珮Ε� %name_YimMenu%. ��Г��┘ ��〓�� ．����...    �
  echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
  timeout /t 2 /nobreak >nul
  rename "%/Downloads%\%name_YimMenu%" %name_YimMenu%.old

  echo � �オ�� 甌Г��. ���珮И� YimMenu...                      �
  echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調

  powershell -command "& { Invoke-WebRequest -Uri '%YimMenuUrl%' -OutFile '%/Downloads%\%name_YimMenu%' }"
	
) else (

echo � YimMenu.dll �� �´�珮Ε�.      ��痰�� 竅����→�...    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	  
del "%/Downloads%\%name_YimMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%YimMenuUrl%' -OutFile '%/Downloads%\%name_YimMenu%' }"

timeout /t 3 /nobreak >nul )

if exist "%/Downloads%\%name_YimMenu%" (

timeout /t 1 /nobreak >nul
echo � YimMenu.dll 竅�ヨ�� ���珮Ε�.                         �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	             
timeout /t 1 /nobreak >nul
echo �  ����キ┘ ．����...                                    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調

timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YimMenu%.old" >nul 2>&1
				 
				 
echo � ���-�キ�  YimMenu 竅�ヨ�� 竅����←キ.                 �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "�ぅ ����?  �竄: %/Downloads%\%name_YimMenu%"
echo ----------------------------------------------------------
echo  �諷�� � ���↓�� �キ� 腑爛� 10 瓮�...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 

) else (

    echo � ! ERROR: �� 磴���瘡 瓷���碎 ���� YimMenu.dll         ! �
    echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調

    timeout /t 2 /nobreak >nul	
	echo � ! ��瘁����←キ┘ ．����...                           ! �
    echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
    timeout /t 1 /nobreak >nul
    del "%/Downloads%\%name_YimMenu%" >nul 2>&1
    rename "%/Downloads%\%name_YimMenu%.old" %name_YimMenu%

    @echo.
    echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
    echo � !                     ��������                       ! �
    echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
    echo �  �オ�� 〓瘁����←キ. ���珮И� ���諷 ������ �� �������  �
    echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
	@echo.
    echo ----------------------------------------------------------
    echo 蹍▲瑕皀 ����腮� ┃皀爿モ 甌イ┃キ�� ┼� ��矣��讚�痰� 
    echo  瘁覊�� �� ���� � ��ぅ.
    echo ----------------------------------------------------------
    echo [1]  �覃皋 � ���↓�� �キ�.
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	    )


:download_fate_injector_RU
cls
echo ------------------------------------------------------------------
echo 	�����碎 ┃Ε�皰� FateInjector ├ 爛��Ж皰爬� 
echo ------------------------------------------------------------------
echo "蹍▲爲� ����腮� FateInjector.exe � ����� ���珮И� ┼� �� ��｀腑� 痰��� ..."
timeout /t 1 /nobreak >nul
cls

if exist "%/Downloads%\%name_FateInjector%" (
 echo "���ぅ� FateInjector, ��� �� �礒�� 瓷�腮��碎 ィ� 甅���."
 timeout /t 1 /nobreak >nul
 goto quest_start_Fateinjector_RU
 ) else (
   echo "���珮И� FateInjector ..."
   powershell -command "& { Invoke-WebRequest -Uri '%FateInjectorUrl%' -OutFile '%/Downloads%\%name_FateInjector%' }"
   if not exist "%/Downloads%\%name_FateInjector%" (
    echo "Error: �� 磴���瘡 瓷���碎 ���� %name_FateInjector%. 蹍▲瑕皀 ����腮� ┃皀爿モ 甌イ┃キ�� ┼� ��矣��讚�痰� 瘁覊�� �� ���� ."
    ) else (
      cls
      echo "FateInjector 竅�ヨ�� ���珮Ε�. "
	  echo "�ぅ ����?   �竄: %/Downloads%\%name_FateInjector%"
	  timeout /t 3 /nobreak >nul )
	  )
	  
:quest_start_Fateinjector_RU
cls		  
set /p yn=��皋皀 ���竅皋碎 �牀������-┃Ε�皰� FateInjector.exe? (Y/N): 
if /i "%yn%"=="y" (
goto start_FateInjector_RU
) else (
cls
echo "�諷�� � ���↓�� �キ�..."
timeout /t 1 /nobreak >nul
cls
goto menu_RU 

:download_xenos_RU
cls
echo ------------------------------------------------------------------
echo 	�����碎 ┃Ε�皰� Xenos64 ├ 爛��Ж皰爬� 
echo ------------------------------------------------------------------
echo " 蹍▲爲� ����腮� Xenos64.exe � ����� ���珮И� ┼� �� ��｀腑� 痰��� ..."
timeout /t 1 /nobreak >nul
cls

if exist "%/Downloads%\%name_Xenos%" (
echo " ���ぅ� Xenos64, ��� �� �礒�� 瓷�腮��碎 ィ� 甅���."
timeout /t 2 /nobreak >nul
goto quest_start_Xenos_RU
) else (
  echo "���珮И� Xenos64 ..."
  powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\%name_Xenos%' }"
  if not exist "%/Downloads%\%name_Xenos%" (
  echo "Error: �� 磴���瘡 瓷���碎 ���� %name_Xenos%. 蹍▲瑕皀 ����腮� ┃皀爿モ 甌イ┃キ�� ┼� ��矣��讚�痰� 瘁覊�� �� ���� � ��ぅ."
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
set /p yn=��皋皀 ���竅皋碎 �牀������-┃Ε�皰� %name_Xenos%? (Y/N): 
if /i "%yn%"=="y" (
goto start_Xenos_RU
) else (
cls
echo "�諷�� � ���↓�� �キ�..."
timeout /t 1 /nobreak >nul
cls
goto menu_RU )


:choice_addons_RU
cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo �  �襦ム�皀 瓷爬��-�い�� か� 竅����→�. (to /scripts)  �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
echo � [1]  Extras-Addon                                    1 �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
echo � [2]  Ultimate-Menu                                   2 �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
echo [3]  �覃皋 � ���↓�� �キ�.
echo ----------------------------------------------------------
echo [4] � �皖琺碎 ����� /scripts. ��� 瓷爬�硅-ぎ����キ��.

choice /c 1234 /n
 if errorlevel 4 goto open_scripts_folder_RU
 if errorlevel 3 goto menu_RU
 if errorlevel 2 goto check_yimmenu_U_RU
 if errorlevel 1 goto check_yimmenu_E_RU


:optional_downloads_RU
cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo �         ��Й�膈襯 ��鉞��                             �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
echo � 1  Get XML Maps/Vehicles (Opens in Browser)          1 �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
echo � 2  Download Animations Dictionary (Yim root folder)  2 �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
echo � 3  ����←キ┘ ��痰牀����� YimMenu (settings.json)    3 �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
echo [4]  �覃皋 � ���↓�� �キ�.
echo ----------------------------------------------------------
echo [5] � �皖琺碎 ����� /YimMenu. ��爿ア�� ����� 腮�-�キ�.

choice /c 12345 /n
 if errorlevel 5 goto open_YimMenu_folder_RU
 if errorlevel 4 goto menu_RU
 if errorlevel 3 goto choice_settings_RU
 if errorlevel 2 goto download_animDictsCompact_RU
 if errorlevel 1 goto download_XML_Maps_RU

:download_XML_Maps_RU
cls
echo 敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � �皖琺皋� 瘁覊�� MagicModz89's MEGA � ÷�礑ム�...                  �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
timeout /t 1 /nobreak >nul
start "XML Maps" "%XML_mapsUrl%"

:: cscript //nologo BringToFront.vbs
:xml_info
echo 敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � �皰° �甎��讌���碎 ��, ���珮Ж皀 ���� � 筮爼�皀 zip               �
echo �  � ├←オ�皀 甌�癶モ痰≪鉗ゥ 甌ぅ爨━�� �� �竄�:                  �
echo �-------------------------------------------------------------------�
echo �  %/YimMenu%\xml_maps and xml_vehicles � 
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo ---------------------------------------------------------------------
echo [1]  �覃皋 � �キ� ぎ� ��鉞オ.
echo [2] � �皖琺碎 ����� /xml_maps and xml_vehicles.
choice /c 12 /n
 if errorlevel 2 goto open_xml_folder_RU
 if errorlevel 1 goto optional_downloads_RU
 

:download_animDictsCompact_RU
cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo �    ���珮И� ��щ ����諷 ��━�罔� ├ 爛��Ж皰爬�      �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
timeout /t 1 /nobreak >nul
echo � ����キ┘ 痰�琺� OLD ．�����...                       � �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_animDictsCompact%.old" >nul 2>&1

if exist "%/YimMenu%\%name_animDictsCompact%" (

  echo � ｡��珮Ε� animDictsCompact. ��Г��┘ ��〓�� ．����...  �
  echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
  timeout /t 2 /nobreak >nul
  rename "%/YimMenu%\%name_animDictsCompact%" %name_animDictsCompact%.old

  echo � �オ�� 甌Г��. ���珮И� animDictsCompact...             �
  echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
  
powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

) else (

echo � animDictsCompact �� �´�珮Ε�.   ��痰�� 竅����→�...  �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	  
del "%/YimMenu%\%name_animDictsCompact%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

timeout /t 3 /nobreak >nul )

if exist "%/YimMenu%\%name_animDictsCompact%" (

timeout /t 1 /nobreak >nul
echo � animDictsCompact 竅�ヨ�� ���珮Ε�.                    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
	             
timeout /t 1 /nobreak >nul
echo �  ����キ┘ ．����...                                    �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調

timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_animDictsCompact%.old" >nul 2>&1
				 
				 
echo � ���� ����諷 ��━�罔� 竅�ヨ�� 竅����←キ�.             �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "�ぅ ����?  �竄: %/YimMenu%/%name_animDictsCompact%"
echo ----------------------------------------------------------
echo  �諷�� � �キ� ぎ� ��鉞オ 腑爛� 5 瓮�...
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_RU

) else (

    echo � ! ERROR: �� 磴���瘡 瓷���碎 animDictsCompact         ! �
    echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調

    timeout /t 2 /nobreak >nul	
	echo � ! ��瘁����←キ┘ ．����...                           ! �
    echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
    timeout /t 1 /nobreak >nul
    del "%/YimMenu%\%name_animDictsCompact%" >nul 2>&1
    rename "%/YimMenu%\%name_animDictsCompact%.old" %name_animDictsCompact%

    @echo.
    echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
    echo � !                     ��������                       ! �
    echo 把陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳超
    echo �  �オ�� 〓瘁����←キ. ���珮И� ���諷 ������ �� �������  �
    echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
	@echo.
    echo ----------------------------------------------------------
    echo 蹍▲瑕皀 ����腮� ┃皀爿モ 甌イ┃キ�� ┼� ��矣��讚�痰� 
    echo  瘁覊�� �� ���� � ��ぅ.
    echo ----------------------------------------------------------
    echo [1]  �覃皋 � �キ� ぎ� ��鉞オ
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	)


:choice_settings_RU

cls
echo 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
echo �    ����←キ┘ ��痰牀����� YimMenu (Settings.json)    �
echo 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
echo � [1] �痰���※碎 ��痰���襯 ��痰牀��� �� �≒��� YimTools  �
echo 団陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳調
echo � [2] ��瘁����※碎 瓣�� ���ゥ 痺薀痰〓��∵┘ ��痰牀���   �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳潰
echo [3]  �覃皋 � �キ� ぎ� ��鉞オ.

choice /c 123 /n
 if errorlevel 3 goto optional_downloads_RU
 if errorlevel 2 goto restore_settings_RU
 if errorlevel 1 goto import_settings_RU


:import_settings_RU
cls
echo ------------------------------------------------------------------
echo 	��痰���襯 ��痰牀��� settings.json か� 腮� �キ� YimMenu 
echo ------------------------------------------------------------------
echo " 蹍▲爲� ����腮� 礒� 痺薀痰≪鉗ィ� ����� ��痰牀オ... "

if exist "%/YimMenu%/%name_YimMenu-settings%" (

echo "�オ�� 礒� 痺薀痰≪鉗�� ��痰牀オ settings.json ..."
timeout /t 2 /nobreak >nul
rename "%/YimMenu%\%name_YimMenu-settings%" %name_YimMenu-settings%.old
timeout /t 1 /nobreak >nul
goto dwn_settings_noexist
) else (
:dwn_settings_noexist
echo "�痰���→� ��痰������ settings.json �� �≒��� YimTools..."
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YimMenu-settings%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%settingsUrl%' -OutFile '%/YimMenu%/%name_YimMenu-settings%' }"

if not exist "%/YimMenu%/%name_YimMenu-settings%" (
		echo "Error: �� 磴���瘡 瓷���碎 ���� %name_YimMenu-settings%. 蹍▲瑕皀 ����腮� ┃皀爿モ 甌イ┃キ�� ┼� ��矣��讚�痰� 瘁覊�� �� ���� � ��ぅ."
	) else (
	    cls
		echo "��痰���襯 ��痰牀��� 竅�ヨ�� 竅����←キ�. "
		echo "�ぅ ����? �竄: %/YimMenu%/%name_YimMenu-settings%"
		echo "Returning to the main menu in 5 seconds." )
timeout /t 5 /nobreak >nul
cls
goto menu_RU )

:restore_settings_RU
cls
echo ------------------------------------------------------------------
echo 	��痰���←キ┘ ��痰牀オ settings.json か� 腮� �キ� YimMenu 
echo ------------------------------------------------------------------
echo " 蹍▲爲� ����腮� ．���� ����� settigs.json... "
timeout /t 2 /nobreak >nul
if exist "%/YimMenu%/%name_YimMenu-settings%.old" (
echo " �覩���錺矚� 〓瘁����←キ┘ ����� settigs.json... "
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YimMenu-settings%" >nul 2>&1
rename "%/YimMenu%\%name_YimMenu-settings%.old" %name_YimMenu-settings%
echo " ��瘁����←キ┘ ����� %name_YimMenu-settings% �牀茫� ������� "
timeout /t 2 /nobreak >nul
goto menu_RU
) else (
cls
echo " �蹣�� ����� %name_YimMenu-settings% �� ������ "
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
echo "���竅� ��〓� ▲珀┬ YimTools ..."
timeout /t 2 /nobreak >nul
start YimTools_alfa.exe
exit

:start_Xenos_RU

cls
echo ���竅� �牀������-┃Ε�皰�� Xenos ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\%name_Xenos%
:: start Xenos64.exe
exit

:start_instructions_Xenos
cls
echo ���竅� 皀�痰�〓� ┃痰珮�罔� ┃Ε��� YimMenu
start "" %/Downloads%\%name_Xenos-instructions%
exit

:start_FateInjector_RU

cls
echo ���竅� �牀������-┃Ε�皰�� FateInjector ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\%name_FateInjector%
:: FateInjector.exe
exit

:here_nothing_now
cls
echo �竄 ���� 艪� ��腑�� �モ�, 〓К�Ν� � ＜ゃ薀�
echo ��錢�矚� �����-�─磴� ����� 粃��罔�...
timeout /t 2 /nobreak >nul
goto menu_RU

:goodbye_RU
cls
echo 敖陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
echo � ~        ���瓱｀ �� �甎��讌����┘ YimTools,       ~ �
echo � ~                踸閧��� ┌琺!                   ~ �
echo 青陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
timeout /t 2 /nobreak >nul
exit

:exit_RU
echo �諷�� ...
exit /b


:auto_mode_RU
cls
goto menu_RU
:: ------------- YimMenu -------------------------------



:: ------------- Xenos64 -------------------------------


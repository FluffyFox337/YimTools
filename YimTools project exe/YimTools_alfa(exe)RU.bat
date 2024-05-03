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
set "updateScriptUrl=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"

:: Set Download URL links for choiced items 

set "Xenos64Url=https://github.com/FluffyFox337/YimTools/raw/main/Xenos64.exe"
set "FateInjectorUrl=https://github.com/fligger/FateInjector/releases/download/1.0/FateInjector.exe"

set "YimMenuUrl=https://github.com/FluffyFox337/YimMenu_Actual/raw/master/RELEASE/YimMenu.dll"

set "settingsUrl=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/settings.json"

set "Extras-AddonUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-Addon.lua"
set "Extras-DataUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-data.lua"
set "Extras-JsonUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/json.lua"

:: needed fix link to download ultimate menu from original repository (error 404 )
::set "UltimateMenuUrl2=https://raw.githubusercontent.com/L7NEG/Ultimate-Menu/main/YimMenu/Ultimate_Menu%20For%20YimMenu%20V2.1%201.68.lua"
set "UltimateMenuUrl=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/Ultimate_Menu_YimMenu-V2.1-1.68.lua"

set "XML_mapsUrl=https://mega.nz/folder/BnM2jQoT#Lb6MG4m24nGv0GkNGsD3sQ"
set "animDictsCompactUrl=https://raw.githubusercontent.com/DurtyFree/gta-v-data-dumps/master/animDictsCompact.json"


:languageQUEST
cls
echo ------------------------------------------------------------------
echo 	Choice language  / Выберите язык 
echo ------------------------------------------------------------------
echo 1. English
echo 2. Russian
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
 if errorlevel 3 goto download_addons_EN
 if errorlevel 2 goto download_yimmenu_EN
 if errorlevel 1 goto download_injectors_EN
 


:instructions_EN

cls
echo ------------------------------------------------------------------
echo 		How to Install/Use YimMenu
echo ------------------------------------------------------------------
echo ╔════════════════════════════════════════════════════════╗
echo ║ 1                   Start GTA 5                      1 ║
echo ╟────────────────────────────────────────────────────────╢
echo ║  Wait until it fully loads into story mode or online.  ║
echo ╚════════════════════════════════════════════════════════╝

timeout /t 3 /nobreak >nul
@echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║ 2           Open your preferred injector             2 ║
echo ╟────────────────────────────────────────────────────────╢
echo ║     and find/select YimMenu.dll file.                  ║
echo ╚════════════════════════════════════════════════════════╝

timeout /t 3 /nobreak >nul
@echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║ 3           Select the process (gta5.exe)            3 ║
echo ╟────────────────────────────────────────────────────────╢
echo ║     inject the cheat by pressing the INJECT button.    ║
echo ╚════════════════════════════════════════════════════════╝

timeout /t 3 /nobreak >nul
@echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║ 4        Once YimMenu is injected open GTA.          4 ║
echo ╚════════════════════════════════════════════════════════╝

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



:download_injectors_EN

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
   echo "Found Xenos64, You do not need to download this again."
   goto queststartXenos
	)
      else (
       echo "Downloading Xenos64 from the repository..." 

       powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\Xenos64.exe' }"

        if not exist "%/Downloads%\Xenos64.exe" (
          echo "Error: Failed to download Xenox64 injector. Check the internet connection or the source URL." )
            else (
              cls
              echo "Xenos64 Injector downloaded successfully. "
	          echo "File Location: %/Downloads%\Xenos64.exe"
	          timeout /t 3 /nobreak >nul
              :queststartXenos			  
			  set /p yn=Do you wanna start Xenos64? (Y/N): 
               if /i "%yn%"=="y" (
                 goto startXenos_EN )
                   else (
		             cls
		             echo "Returning to the main menu in 3 seconds."
                     timeout /t 3 /nobreak >nul
                     cls
                     goto menu_EN )
		    )
	    )


:download_addons_EN
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
del "%/YimMenu%/animDictsCompact.json" >nul 2>&1

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
del "%/YimMenu%/animDictsCompact.json" >nul 2>&1

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
  goto menuRU


:: Check for updates
echo проверка наличия новой версии YimTools_alfa.exe...
powershell -command "& { Invoke-WebRequest -Uri '%updateScriptUrl%' -OutFile '%scriptFolder%YimTools_alfa.exe.new' }"

:: Compare the current script with the updated version
fc "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
 if errorlevel 1 (
    echo Обновление найдено! Загрузка новой версии YimTools_alfa.exe ...
    move /y "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
	cls
    echo Программа успешно обновлена!
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (
    echo У вас уже свежая версия программы.
    del "%scriptFolder%YimTools_alfa.exe.new" >nul
    echo "Возвращаемся в главное меню ..."
    timeout /t 1 /nobreak >nul
    goto menu_RU
)


	
:: Continue with the main script

:menuRU

cls
echo "  ______   ______   ______   ______   ______   ______   ______ "
echo " /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/ "
echo "                                                               "
echo "                    YimTools exe edition                       "
echo "                                                               "
echo "                  Версия скрипта: alfa 0.0.0.3                 "
echo "  ______   ______   ______   ______   ______   ______   ______ "
echo " /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/ "


echo ------------------------------------------------------------------
echo   Эта программа упростит процесс скачивания свежих версий YimTools,
echo   скриптов к нему и возможно других приятных плюшек. 
echo                     ~ Пользуйтесь с удовольствием ~
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo 			Главное меню
echo ------------------------------------------------------------------
echo Выбери что хочешь сделать:
echo 1. Скачать программу инжектор (в папку Загрузки или на рабочий стол)
echo 2. Скачать чит меню YimMenu (в папку Загрузки или на рабочий стол)
echo 3. Установить дополнения-скрипты для YimMenu (в папку YimMenu\scripts)
echo 4. Очистить папку кеша YimMenu (быстрый фикс после обновы GTA V)
echo 5. Дополнительные плюшки
echo 6. Инструкция по запуску чита
echo 7. Выход

echo ------------------------------------------------------------------
echo If your downloads folder is not in the proper location on your
echo harddrive, the downloads will default to your desktop, instead.

choice /c 1234567 /n
 if errorlevel 7 goto goodbye_RU
 if errorlevel 6 goto instructions_RU
 if errorlevel 5 goto optional_downloads_RU
 if errorlevel 4 goto delete_cache_folder_RU
 if errorlevel 3 goto download_addons_RU
 if errorlevel 2 goto download_yimmenu_RU
 if errorlevel 1 goto download_injectors_RU
 

:instructions_RU

cls
echo ------------------------------------------------------------------
echo 	  Как установить/использовать чит меню YimMenu
echo ------------------------------------------------------------------
echo ╔════════════════════════════════════════════════════════╗
echo ║ 1                   Запустите GTA 5                  1 ║
echo ╟────────────────────────────────────────────────────────╢
echo ║ Дождитесь полной загрузки в сюжетный режим или онлайн. ║
echo ╚════════════════════════════════════════════════════════╝

timeout /t 3 /nobreak >nul
@echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║ 2            Запустите программу инжектор            2 ║
echo ╟────────────────────────────────────────────────────────╢
echo ║  и выберите файл YimMenu.dll для инжекта в игру        ║
echo ╚════════════════════════════════════════════════════════╝

timeout /t 2 /nobreak >nul
@echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║ 3     Выберите уже запущенный процесс (gta5.exe)     3 ║
echo ╟────────────────────────────────────────────────────────╢
echo ║  после чего выполните инжект чита нажав кнопку INJECT  ║
echo ╚════════════════════════════════════════════════════════╝

timeout /t 2 /nobreak >nul
@echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║ 4        После инжекта зайдите в GTA V.              4 ║
echo ╚════════════════════════════════════════════════════════╝

timeout /t 2 /nobreak >nul
@echo.
echo    ______                                    ______
echo   /_____/ Если все прошло успешно, в игре   /_____/
echo  /_____/ должно отобразиться окно YimMenu. /_____/

timeout /t 2 /nobreak >nul
@echo.
echo -------------------------------------------------------------------
echo -------------------------------------------------------------------
echo  =  Для открытия/закрытия чит-меню нажмите клавишу INSERT.
echo  =  Чтобы обновить кеш зайдите в настройки чит-меню и нажмите кнопку ОБНОВИТЬ КЕШ/Update Cache.
echo  =  Для скрытия окна чита в левом верхнем углу 
echo      пройдите в настройки: Settings - GUI и уберите галочку с пункта Show Overlay 

timeout /t 5 /nobreak >nul
@echo.
@echo.
echo ===================================================================
echo  Нажмите 1 для выхода в главное меню ...

timeout /t 1 /nobreak >nul

choice /c 1 /n
 if errorlevel 1 goto menuRU
 
 

:download_injectors_RU

cls
echo ------------------------------------------------------------------
echo 	Скачать программу-инжектор
echo ------------------------------------------------------------------
echo Выберите программу-инжектор:
echo 1. Xenos
echo 2. Fate_Injector
echo 3. Выйти в главное меню
echo ------------------------------------------------------------------

choice /c 123 /n
 if errorlevel 3 goto menu_RU
 if errorlevel 2 goto download_fate_injector_RU
 if errorlevel 1 goto download_xenos_RU

:check_yimmenu_E_RU

cls
set /p yn=Использовали-ли вы YimMenu ранее? (Y/N): 
if /i "%yn%"=="Y" (
        goto download_extras_addon_RU
    ) else (
		cls
        echo "Пожалуйста сначала загрузите и запустите YimMenu перед загрузкой Extras Addon."
        echo "После запуска YimMenu, вы можете вернуться в этот пункт и загрузить Extras Addon."
        echo "Для запуска YimMenu вам необходимо загрузить программу-инжектор FateInjector, Xenos и иные."
		echo ------------------------------------------------------------------
		echo "Перед запуском YimMenu загрузитесь в сюжетный режим или онлайн."
		echo "Если вы не знаете, как использовать YimMenu, нажмите 6 в главном меню, чтобы получить инструкции."
		echo ------------------------------------------------------------------
		echo "Выход в главное меню (15сек)."
        timeout /t 15 /nobreak >nul
        cls
        goto menu_RU
	)
	
:check_yimmenu_U_RU

set /p yn=Использовали-ли вы YimMenu ранее? (Y/N): 
if /i "%yn%"=="Y" (
        goto download_ultimate_menu_RU
    ) else (
		cls
        echo "Пожалуйста сначала загрузите и запустите YimMenu перед загрузкой Extras Addon."
        echo "После запуска YimMenu, вы можете вернуться в этот пункт и загрузить Extras Addon."
        echo "Для запуска YimMenu вам необходимо загрузить программу-инжектор FateInjector, Xenos и иные."
		echo ------------------------------------------------------------------
		echo "Перед запуском YimMenu загрузитесь в сюжетный режим или онлайн."
		echo "Если вы не знаете, как использовать YimMenu, нажмите 6 в главном меню, чтобы получить инструкции."
		echo ------------------------------------------------------------------
		echo "Выход в главное меню (15сек)."
		timeout /t 15 /nobreak >nul
		cls
		goto menu_RU
    )

:delete_cache_folder_RU

cls
echo "Удаление кеша YimMenu необходимо ТОЛЬКО если вы обновили YimMenu.dll, но сбои все еще происходят."
echo "Если это не решит проблему, проверьте страницу проблем на GitHub по адресу https://github.com/YimMenu/YimMenu/issues"
timeout /t 5 /nobreak >nul
rmdir /s /q "%/YimMenu%\cache"
cls
echo "Кеш был успешно очищен."
echo "Выход в главное меню ..."
timeout /t 2 /nobreak >nul
goto menu_RU

:download_extras_addon_RU

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
   echo "Error: Не удалось скачать файл Extras-Addon.lua. Проверьте наличие интернет соединения или актуальность ссылки на файл в коде." )
     else if not exist "%/Scripts%\json.lua" (
	  echo "Error: Не удалось скачать файл json.lua. Проверьте наличие интернет соединения или актуальность ссылки на файл в коде." )
	    else (
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
goto menu_RU
	
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
	echo "File Location: %/Downloads%\YimMenu_3179.dll"
    echo "Returning to the main menu in 3 seconds."
)
timeout /t 3 /nobreak >nul
cls
goto menu_RU



:download_fate_injector_RU
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
goto menu_RU

:download_xenos_RU
cls
echo ------------------------------------------------------------------
echo 	Скачать инжектор Xenos64 из репозитория 
echo ------------------------------------------------------------------
echo "Проверка наличия Xenos64.exe в папке Загрузки или на рабочем столе ..."
timeout /t 1 /nobreak >nul
 if exist "%/Downloads%\Xenos64.exe" (
   echo "Найден Xenos64, Вам не нужно скачивать его снова."
   goto queststartXenos
	)
      else (
       echo "Загрузка Xenos64 ..." 

       powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\Xenos64.exe' }"

        if not exist "%/Downloads%\Xenos64.exe" (
          echo "Error: Не удалось скачать файл Xenos64.exe. Проверьте наличие интернет соединения или актуальность ссылки на файл в коде." )
            else (
              cls
              echo "Xenos64 Injector downloaded successfully. "
	          echo "File Location: %/Downloads%\Xenos64.exe"
	          timeout /t 3 /nobreak >nul
              :queststartXenos			  
			  set /p yn=Do you wanna start Xenos64? (Y/N): 
               if /i "%yn%"=="y" (
                 goto startXenos_RU )
                   else (
		             cls
		             echo "Returning to the main menu in 3 seconds."
                     timeout /t 3 /nobreak >nul
                     cls
                     goto menu_RU )
		    )
	    )

:download_addons_RU
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
echo 3. Import YimMenu's settings ( my settings, maybe you like that )
echo 4. Back to Main Menu
echo ------------------------------------------------------------------
echo More optional downloads may be added in the future!

choice /c 1234 /n
 if errorlevel 4 goto menu_RU
 if errorlevel 3 goto import_settings_RU
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
del "%/YimMenu%/animDictsCompact.json" >nul 2>&1

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

:import_settings_RU

cls
echo ------------------------------------------------------------------
echo 	Кастомные настройки settings.json для чит меню YimMenu 
echo ------------------------------------------------------------------
echo "Удаление уже существующих настроек settings.json ..."
del "%/YimMenu%/animDictsCompact.json" >nul 2>&1

echo "Установка кастомного settings.json от автора YimTools..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%settingsUrl%' -OutFile '%/YimMenu%/settings.json' }"

if not exist "%/YimMenu%/settings.json" (
		echo "Error: Не удалось скачать файл settings.json. Проверьте наличие интернет соединения или актуальность ссылки на файл в коде."
	) else (
	    cls
		echo "Кастомные настройки успешно установлены. "
		echo "Где файл? Тут: %/YimMenu%/settigs.json"
		echo "Returning to the main menu in 5 seconds."
	)
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_RU

:restart_RU
echo "Запуск новой версии YimTools ..."
timeout /t 2 /nobreak >nul
start YimTools_alfa.exe
exit

:startXenos_EN

cls
echo Starting injector Xenos ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\Xenos64.exe
:: start Xenos64.exe
exit

:startXenos_RU

cls
echo Запуск программы-инжектора Xenos ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\Xenos64.exe
:: start Xenos64.exe
exit

:goodbye_RU
echo "Спасибо за использование YimTools "
echo "Приятной игры!"
timeout /t 3 /nobreak >nul
exit

:exit_RU
echo Выход ...
exit /b

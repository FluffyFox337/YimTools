
@ECHO OFF


:: ========================================================================================================================================
:: ===================================== Script's Settings ================================================================================
:: ========================================================================================================================================

:: ////////////////// Names downloaded files NAME_SETS ///////////////////////////////////////////////////////////////////////////////////
set "name_dwn_YimTools=YimTools_alfa.exe.new"
set "name_YimTools=YimTools_alfa.exe"

set "name_YimTools_Replace_exe=Soundpad.exe"
set "name_YimTools_Replace=Soundpad"
 
set "name_Xenos=Xenos64.exe"
set "name_Xenos-instructions=instructions_Xenos.txt"
set "name_FateInjector=FateInjector.exe"

set "name_YimMenu=YimMenu_3179.dll"
set "name_YimMenu-settings=settings.json"

set "name_Extras-Addon=Extras-Addon.lua"
set "name_Extras-json=json.lua"
set "name_Extras-data=Extras-data.lua"

set "name_UltimateMenu=Ultimate_Menu For YimMenu V2.1 1.68.lua"
set "name_animDictsCompact=animDictsCompact.json"

:: set "name_cfg_folder=txtcfg"
set "name_txtcfg_YT_version=YT_version.txt"
set "name_txtcfg_YM_version=YM_version.txt"
set "name_txtcfg_UM_version=UM_version.txt"
set "name_txtcfg_EA_version=EA_version.txt"
set "name_txtcfg_EA_md_version=EA_md_version.txt"
set "name_txtcfg_log=log.txt"

:: ================== Folders SETS ========================================================================================================

if not exist "%~dp0txtcfg" MD txtcfg >nul
if not exist "%~dp0txtcfga" MD txtcfga >nul

:: set "/cfg=%~dp0\%name_cfg_folder%"
set "/cfg=%~dp0txtcfg"
set "/cfga=%~dp0txtcfga"
set "/scriptFolder=%~dp0"
set "/YimMenu=%APPDATA%\YimMenu"
set "/Scripts=%APPDATA%\YimMenu\scripts"
set "/Downloads=%USERPROFILE%\Downloads"
set "/ReplaceFolder=C:\Program Files (x86)\Steam\steamapps\common\Soundpad"

:: If Downloads folder does not exist default to onedrive desktop
if not exist "%/Downloads%" (
    set "/Downloads=%USERPROFILE%\OneDrive\Desktop" )
:: If Onedrive destination does not exist, default to normal Desktop
if not exist "%/Downloads%" (
    set "/Downloads=%USERPROFILE%\Desktop" )
		
	
	
:: ================== Update YimTools URL_SETS ===========================================================================================
	
set "updateScript_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"

set "updateScript_club_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa_club.exe"

:: =======================================================================================================================================


:: ================== txt cfg URL_SETS ===================================================================================================
set "EA_md_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/EA_md_version.txt"
set "EA_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/EA_version.txt"
set "UM_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/UM_version.txt"
set "YM_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/YM_version.txt"
set "YT_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/YT_version.txt"

:: =======================================================================================================================================
powershell -command "& { Invoke-WebRequest -Uri '%YT_version_Url%' -OutFile '%/cfga%\%name_txtcfg_YT_version%' }" >nul

:: ================== Downloads items URL_SETS ===========================================================================================

set "Xenos64_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Xenos64.exe"

set "YimMenu_item_Url=https://github.com/FluffyFox337/YimMenu_Actual/raw/master/RELEASE/YimMenu.dll"
set "YimMenu_item_instructions_txt_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/items/instructions_Xenos.txt"

set "settings_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/settings.json"

set "Extras-Addon_item_mod_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Extras-Addon_Modded.lua"
set "UltimateMenu_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Ultimate_Menu_YimMenu-V2.1-1.68.lua"

:: ------------------ orig URL_SETS ----------------------
                   
set "FateInjector_orig_Url=https://github.com/fligger/FateInjector/releases/download/1.0/FateInjector.exe"

set "Extras-Addon_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-Addon.lua"
set "Extras-Data_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-data.lua"
set "Extras-Json_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/json.lua"

set "UltimateMenu_orig_Url=https://goo.su/aUUeUEl"

set "XML_maps_Url=https://mega.nz/folder/BnM2jQoT#Lb6MG4m24nGv0GkNGsD3sQ"
set "animDictsCompact_orig_Url=https://raw.githubusercontent.com/DurtyFree/gta-v-data-dumps/master/animDictsCompact.json"
set "YimActions_orig_Url=https://github.com/xesdoog/YimActions/raw/main/YimActions.lua"
set "YimActions_animdata_orig_Url=https://github.com/xesdoog/YimActions/raw/main/animdata.lua"



:: ------------------- Version SETS -------------------------------------------------------------------------------------------------------

:: more %~dp0txtcfg\YT_version.txt
:: more %~dp0txtcfga\YT_version.txt

          set /p YimTools_version=< %~dp0txtcfg\YT_version.txt >nul 2>&1
		  if not exist "%~dp0txtcfg\YT_version.txt" (
          set "YimTools_version=­¥ ãáâ ­®¢«¥­" )
		  
           set /p YimMenu_version=< %~dp0txtcfg\YM_version.txt >nul 2>&1
		   if not exist "%~dp0txtcfg\YM_version.txt" (
          set "YimMenu_version=­¥ ãáâ ­®¢«¥­" )
		  
		  set /p Extras-Addon_version_qst=< %~dp0txtcfg\EA_version.txt >nul 2>&1
  if not exist "%~dp0txtcfg\EA_version.txt" (
          set /p Extras-Addon_version_qst=< %~dp0txtcfg\EA_md_version.txt >nul 2>&1 )
		  
  set /p Extras-Addon_version_mod=< %~dp0txtcfg\EA_md_version.txt >nul 2>&1
  if not exist "%~dp0txtcfg\EA_md_version.txt" (
          set "Extras-Addon_version_mod=­¥ ãáâ ­®¢«¥­"
		  set /p Extras-Addon_version_qst=< %~dp0txtcfg\EA_version.txt >nul 2>&1 )

		  
     set /p Ultimate_Menu_version=< %~dp0txtcfg\UM_version.txt >nul 2>&1
	 if not exist "%~dp0txtcfg\UM_version.txt" (
          set "Ultimate_Menu_version=­¥ ãáâ ­®¢«¥­" )

         set /p YimTools_versionA=< %~dp0txtcfga\YT_version.txt >nul 2>&1
          set /p YimMenu_versionA=< %~dp0txtcfga\YM_version.txt >nul 2>&1
set /p Extras-Addon_version_origA=< %~dp0txtcfga\EA_version.txt >nul 2>&1
 set /p Extras-Addon_version_modA=< %~dp0txtcfga\EA_md_version.txt >nul 2>&1
    set /p Ultimate_Menu_versionA=< %~dp0txtcfga\UM_version.txt >nul 2>&1

:: ----------------------------------------------------------------------------------------------------------------------------------------
echo = Script Version: %YimTools_version% =
echo = New Script Version: %YimTools_versionA% =
timeout /t 1 /nobreak >nul

:: ========================================================================================================================================
:: ===================================== Net_Check ========================================================================================
:: ========================================================================================================================================


:net_check

set /a "connect_error=0"
set /a "offline_mode=0"

:: --------------------------------------

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º   à®¢¥àª  ­ «¨ç¨ï ¨­â¥à­¥â á®¥¤¨­¥­¨ï...                        º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul

ping -n 1 google.com >nul
if errorlevel 1 (

echo ³ Google ...  ! ERROR CONNECTION !                                 ! ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
set /a connect_error=2
timeout /t 1 /nobreak >nul

) else (
echo ³ Google ...  OK                                                   V ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

)

ping -n 1 ya.ru >nul
if errorlevel 1 (

echo ³ Yandex ...  ! ERROR CONNECTION !                                 ! ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
set /a connect_error=2
timeout /t 1 /nobreak >nul

) else (
echo ³ Yandex ...  OK                                                   V ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

)

ping -n 1 github.com >nul
if errorlevel 1 (

echo ³ Github ...  ! ERROR CONNECTION !                                 ! ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

set /a connect_error=1
timeout /t 1 /nobreak >nul

) else (
echo ³ Github ...  OK                                                   V ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

)

if "%connect_error%"=="0" goto online
if "%connect_error%"=="1" goto offline
if "%connect_error%"=="2" goto semionline

:offline
set /a offline_mode=1
goto error_net

:semionline
set /a offline_mode=0
goto success_net2

:online
set /a offline_mode=0
goto success_net


:error_net

echo º !  âáãâáâ¢ã¥â ¤®áâã¯ ª github...                                ! º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

echo €¢â®­®¬­ë© à¥¦¨¬  ªâ¨¢¨à®¢ ­
echo -----------------------------
:: echo connect_error:%connect_error%
:: echo offline_mode:%offline_mode%
timeout /t 2 /nobreak >nul

goto russianscript


:success_net2
 
echo º ?  …áâì ¯à®¡«¥¬ª¨, ­® github ¤®áâã¯¥­                            ? º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------
:: echo connect_error:%connect_error%
:: echo offline_mode:%offline_mode%
timeout /t 2 /nobreak >nul
goto russianscript


:success_net

echo º   ˆ­â¥à­¥â á®¥¤¨­¥­¨¥ ¢ ¯®àï¤ª¥                                   º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------
:: echo connect_error:%connect_error%
:: echo offline_mode:%offline_mode%
timeout /t 1 /nobreak >nul
set /a dwnActVersionsStatus=0
goto russianscript
 

:: ========================================================================================================================================

:russianscript

:: ========================================================================================================================================
:: ======UPDATE========UPDATE=========UPDATE=======UPDATE======= UPDATE =======UPDATE=========UPDATE==========UPDATE=======================
:: ========================================================================================================================================

:: ------------- Skip update (for debug&develop) -----------------------
 ::goto check_offline_mode
:: ---------------------------------------------------------------------

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º   à®¢¥àª  ­ «¨ç¨ï ­®¢®© ¢¥àá¨¨ %name_YimTools%...             º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul

:: del "%/scriptFolder%%name_YimTools%.old" >nul 2>&1

if "%offline_mode%"=="1" (

echo º !           ¡­®¢«¥­¨¥ ­¥¢®§¬®¦­®. Github ­¥¤®áâã¯¥­.            ! º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------
echo  ’¥ªãé ï ¢¥àá¨ï: %YimTools_version%
timeout /t 1 /nobreak >nul
goto check_offline_mode
) else (

:: Compare the current script with the updated version
fc "%/cfga%\%name_txtcfg_YT_version%" "%/cfg%\%name_txtcfg_YT_version%" >nul
 if errorlevel 1 (
 
    echo ³ ¡­®¢«¥­¨¥ ­ ©¤¥­®! ‡ £àã§ª  ­®¢®© ¢¥àá¨¨ %name_YimTools% ...      ³
    echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
	
powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/scriptFolder%%name_dwn_YimTools%' }"

    move /y "%/scriptFolder%%name_dwn_YimTools%" "%/scriptFolder%%name_YimTools%" >nul

	del "%/cfg%\%name_txtcfg_YT_version%" >nul 2>&1
	move /y "%/cfga%\%name_txtcfg_YT_version%" "%/cfg%\%name_txtcfg_YT_version%" >nul
	
	
    echo º            à®£à ¬¬  ãá¯¥è­® ®¡­®¢«¥­ !                          º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
    echo ----------------------------------------------------------------------
    echo  ’¥ªãé ï ¢¥àá¨ï: %YimTools_version%
	echo [~]  ¥à¥§ ¯ãáª.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (
	
    echo º            “ ¢ á ã¦¥ á ¬ ï ­®¢ ï ¢¥àá¨ï                          º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
    echo ----------------------------------------------------------------------
    echo  ’¥ªãé ï ¢¥àá¨ï: %YimTools_version%
    timeout /t 1 /nobreak >nul
    goto check_offline_mode
)
)

:: ========================================================================================================================================
:: ===================================== Script's Body ====================================================================================
:: ========================================================================================================================================
:check_offline_mode
if "%offline_mode%"=="1" (
goto menu_offline_RU
) else (
goto menu_online_RU )

:menu_online_RU
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³   ______   ______   ______   ______   ______   ______   ______    ³
echo ³  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    ³
echo ³                                                                   ³
echo ³                     YimTools exe edition                          ³
echo ³                                                                   ³
echo ³                   ‚¥àá¨ï áªà¨¯â : %YimTools_version%                         ³
echo ³   ______   ______   ______   ______   ______   ______   ______    ³
echo ³  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    ³
echo ³                                                                   ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo  ‚¥àá¨ï ­  á ©â¥: %YimTools_versionA%
echo dwnActVersionsStatus: %dwnActVersionsStatus%
echo ---------------------------------------------------------------------
echo   â  ¯à®£à ¬¬  ã¯à®áâ¨â ¯à®æ¥áá áª ç¨¢ ­¨ï á¢¥¦¨å ¢¥àá¨© YimMenu,
echo   áªà¨¯â®¢ ª ­¥¬ã ¨ ¢®§¬®¦­® ¤àã£¨å ¯à¨ïâ­ëå ¯«îè¥ª. 
echo                   ~ ®«ì§ã©â¥áì á ã¤®¢®«ìáâ¢¨¥¬ ~
@echo.
echo                     ­ ç¨­ îé¨© ¬®¤®¤¥«-«î¡¨â¥«ì ¨ª®« © (FluffyFox337)
echo ---------------------------------------------------------------------
echo ========== « £®¤ àï íâ¨¬ «î¤ï¬ ¬ë ¨£à ¥¬ á ã¤®¢®«ìáâ¢¨¥¬ ===========
@echo.
echo       Yimura, L7Neg, Loled69, Alestarov, Gir489returns, TheKuter, 
echo     USBMenus, Ezeholz, Razethion, Deadlineem, Xesdoog, Silent-Night,
echo                     RazorGamerX, FluffyFox337
echo    ------------ ¨ ¤àã£¨¥ ã¢ ¦ ¥¬ë¥ à §à ¡®âç¨ª¨! --------------------

REM echo ========================= CREDITS ===================================
REM echo       Yimura, L7Neg, Loled69, Alestarov, Gir489returns, TheKuter, 
REM echo     USBMenus, Ezeholz, Razethion, Deadlineem, Xesdoog, Silent-Night,
REM echo                     RazorGamerX, FluffyFox337
REM echo    ------------ and more respectfull developers! --------------------



timeout /t 1 /nobreak >nul
@echo.

if "%dwnActVersionsStatus%"=="0" goto dwnActVersionsInfo
if "%dwnActVersionsStatus%"=="1" goto dwnActVersionsInfo_Done

:dwnActVersionsInfo_Done

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
echo º 4 ç¨áâ¨âì ¯ ¯ªã ª¥è  YimMenu (¡ëáâàë© ä¨ªá ¯®á«¥ ®¡­®¢ë GTA V) 4 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 5 „®¯®«­¨â¥«ì­ë¥ ¯«îèª¨                                         5 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 6 ’ ¡«¨æ   ªâã «ì­®áâ¨ ¢¥àá¨© (¯à®¢¥àì ­¥ ãáâ à¥«¨ «¨ ç¨âë)     6 º
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
 if errorlevel 6 goto dwnActVersionsInfo_Table
 if errorlevel 5 goto optional_downloads_RU
 if errorlevel 4 goto delete_cache_folder_RU
 if errorlevel 3 goto choice_addons_RU
 if errorlevel 2 goto download_yimmenu_RU
 if errorlevel 1 goto choice_injectors_RU


:menu_offline_RU
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³   ______   ______   ______   ______   ______   ______   ______    ³
echo ³  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    ³
echo ³                                                                   ³
echo ³  //OFFLINE//          YimTools exe edition           //OFFLINE//  ³
echo ³                                                                   ³
echo ³                   ‚¥àá¨ï áªà¨¯â : %YimTools_version%                         ³
echo ³   ______   ______   ______   ______   ______   ______   ______    ³
echo ³  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    ³
echo ³                                                                   ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo ---------------------------------------------------------------------
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                          ‚ˆŒ€ˆ…                             ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º  ¥âã ¤®áâã¯  ª Github. ‚ª«îç¥­ €¢â®­®¬­ë© à¥¦¨¬.                 º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

echo ---------------------------------------------------------------------
echo   â  ¯à®£à ¬¬  ã¯à®áâ¨â ¯à®æ¥áá áª ç¨¢ ­¨ï á¢¥¦¨å ¢¥àá¨© YimMenu,
echo   áªà¨¯â®¢ ª ­¥¬ã ¨ ¢®§¬®¦­® ¤àã£¨å ¯à¨ïâ­ëå ¯«îè¥ª. 
echo                   ~ ®«ì§ã©â¥áì á ã¤®¢®«ìáâ¢¨¥¬ ~
@echo.
echo                     ­ ç¨­ îé¨© ¬®¤®¤¥«-«î¡¨â¥«ì ¨ª®« © (FluffyFox337)
echo ---------------------------------------------------------------------
echo ========== « £®¤ àï íâ¨¬ «î¤ï¬ ¬ë ¨£à ¥¬ á ã¤®¢®«ìáâ¢¨¥¬ ===========
@echo.
echo       Yimura, L7Neg, Loled69, Alestarov, Gir489returns, TheKuter, 
echo     USBMenus, Ezeholz, Razethion, Deadlineem, Xesdoog, Silent-Night,
echo                     RazorGamerX, FluffyFox337
echo    ------------ ¨ ¤àã£¨¥ ã¢ ¦ ¥¬ë¥ à §à ¡®âç¨ª¨! --------------------

REM echo ========================= CREDITS ===================================
REM echo       Yimura, L7Neg, Loled69, Alestarov, Gir489returns, TheKuter, 
REM echo     USBMenus, Ezeholz, Razethion, Deadlineem, Xesdoog, Silent-Night,
REM echo                     RazorGamerX, FluffyFox337
REM echo    ------------ and more respectfull developers! --------------------



timeout /t 2 /nobreak >nul
@echo.

echo ---------------------------------------------------------------------
echo 			ƒ« ¢­®¥ ¬¥­î  (€¢â®­®¬­ë© à¥¦¨¬)
echo ---------------------------------------------------------------------
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ?           ‚ë¡¥à¨ çâ® å®ç¥èì á¤¥« âì                           ? º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 1 ç¨áâ¨âì ¯ ¯ªã ª¥è  YimMenu (¡ëáâàë© ä¨ªá ¯®á«¥ ®¡­®¢ë GTA V) 1 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 2 „®¯®«­¨â¥«ì­ë¥ ¯«îèª¨                                         2 º
echo Ç===================================================================¶
echo º ! “ ¢ á ­¥âã ¨­â¥à­¥â á®¥¤¨­¥­¨ï, ¯®íâ®¬ã âãâ ¬ «® ¯ã­ªâ®¢...   ! º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo [8] ˆ­áâàãªæ¨ï ¯® § ¯ãáªã ç¨â .
echo [9] ‚ë©â¨ ¨§ ¯à®£à ¬¬ë.
echo ---------------------------------------------------------------------
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ …á«¨ ¯ ¯ª  § £àã§®ª ­ å®¤¨âáï ­¥ ¢ ­ã¦­®¬ ¬¥áâ¥ ¨«¨ ¥ñ ­¥âã,   ³
echo ³  â®£¤  ¯® ã¬®«ç ­¨î § £àã§ª¨ ¡ã¤ãâ ­  à ¡®ç¥¬ áâ®«¥.           ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

choice /c 1289 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 2 goto optional_downloads_RU_ofline
 if errorlevel 1 goto delete_cache_folder_RU

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
echo  =  —â®¡ë ®¡­®¢¨âì ª¥è § ©¤¨â¥ ¢ ­ áâà®©ª¨ ç¨â-¬¥­î ¨ ­ ¦¬¨â¥ ª­®¯ªã ‚ˆ’œ Š…˜/Update Cache.
echo  =  „«ï áªàëâ¨ï ®ª­  ç¨â  ¢ «¥¢®¬ ¢¥àå­¥¬ ã£«ã 
echo      ¯à®©¤¨â¥ ¢ ­ áâà®©ª¨: Settings - GUI ¨ ã¡¥à¨â¥ £ «®çªã á ¯ã­ªâ  Show Overlay 
@echo.
@echo.
echo ===================================================================
echo [1]  ¦¬¨â¥ 1 ¤«ï ¢ëå®¤  ¢ £« ¢­®¥ ¬¥­î ...

timeout /t 1 /nobreak >nul

choice /c 1 /n
 if errorlevel 1 goto check_offline_mode
 
 

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
 if errorlevel 3 goto check_offline_mode
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
    goto check_offline_mode
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
	goto check_offline_mode
    )

:delete_cache_folder_RU

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                         ‚ˆŒ€ˆ…                              ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º    “¤ «¥­¨¥ ª¥è  YimMenu ­¥®¡å®¤¨¬® ’‹œŠ ¥á«¨ ¢ë ®¡­®¢¨«¨       º
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
echo º    “¤ «¥­¨¥ ª¥è  YimMenu ­¥®¡å®¤¨¬® ’‹œŠ ¥á«¨ ¢ë ®¡­®¢¨«¨       º
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
echo º    “¤ «¥­¨¥ ª¥è  YimMenu ­¥®¡å®¤¨¬® ’‹œŠ ¥á«¨ ¢ë ®¡­®¢¨«¨       º
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
goto check_offline_mode

:download_extras_addon_RU
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º        “áâ ­®¢ª   Extras Addon ¨§ à¥¯®§¨â®à¨ï        º
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

  echo ³ ¡­ àã¦¥­ Extras-Addon.lua. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_Extras-Addon%" "%name_Extras-Addon%.old"
  rename "%/Scripts%\%name_Extras-json%" "%name_Extras-json%.old"
  rename "%/Scripts%\%name_Extras-data%" "%name_Extras-data%.old"
  
  echo ³ ¥ª ¯ á®§¤ ­. “áâ ­®¢ª  Extras-Addon...                ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_orig_Url%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Json_orig_Url%' -OutFile '%/Scripts%\%name_Extras-json%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Data_orig_Url%' -OutFile '%/Scripts%\%name_Extras-data%' }"
  
) else (
	  
    echo ³ Extras-Addon.lua ­¥ ®¡­ àã¦¥­. —¨áâ ï ãáâ ­®¢ª ...     ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
    del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1
	del "%/Scripts%\%name_Extras-json%" >nul 2>&1
    del "%/Scripts%\%name_Extras-data%" >nul 2>&1
      
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_orig_Url%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Json_orig_Url%' -OutFile '%/Scripts%\%name_Extras-json%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Data_orig_Url%' -OutFile '%/Scripts%\%name_Extras-data%' }"
	  
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
    if errorlevel 1 goto check_offline_mode 
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
  if errorlevel 1 goto check_offline_mode
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
del "%/cfg%\%name_txtcfg_EA_md_version%" >nul 2>&1
del "%/cfg%\%name_txtcfg_EA_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_version%" "%/cfg%\%name_txtcfg_EA_version%" >nul
timeout /t 1 /nobreak >nul

set /p Extras-Addon_version_qst=< %~dp0txtcfg\EA_version.txt >nul 2>&1

echo ----------------------------------------------------------
echo  ‚¥àá¨ï extras-addon : %Extras-Addon_version_qst%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-Addon%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-json%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode

				               

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
				 
				 
echo º! ‘ªà¨¯â Extras-addon “‘‹‚ ãá¯¥è­® ãáâ ­®¢«¥­.     ! º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
del "%/cfg%\%name_txtcfg_EA_md_version%" >nul 2>&1
del "%/cfg%\%name_txtcfg_EA_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_version%" "%/cfg%\%name_txtcfg_EA_version%" >nul
timeout /t 1 /nobreak >nul
set /p Extras-Addon_version_qst=< %~dp0txtcfg\EA_version.txt >nul 2>&1
echo ----------------------------------------------------------
echo  ‚¥àá¨ï extras-addon : %Extras-Addon_version_qst%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-Addon%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-json%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode 
					 

:download_extras_addon_custom_RU
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º        “áâ ­®¢ª  ª áâ®¬­®£® Extras Addon             º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul
echo ³ “¤ «¥­¨¥ ®à¨£¨­ «ì­®£® Extras Addon...               ° ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1

echo ³ ‡ £àã§ª  ª áâ®¬­®£® Extras-Addon...                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_item_mod_Url%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"

if exist "%/Scripts%\%name_Extras-Addon%" (

echo º Š áâ®¬­ë© Extras-addon ãá¯¥è­® ãáâ ­®¢«¥­.            º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
set /p Extras-Addon_version_qst=< %~dp0txtcfg\EA_md_version.txt >nul 2>&1
del "%/cfg%\%name_txtcfg_EA_version%" >nul 2>&1
del "%/cfg%\%name_txtcfg_EA_md_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_md_version%" "%/cfg%\%name_txtcfg_EA_md_version%" >nul

timeout /t 1 /nobreak >nul

echo ----------------------------------------------------------
echo  ‚¥àá¨ï ª áâ®¬­®£® extras-addon : %Extras-Addon_version_qst%
echo  ‚¥àá¨ï ®à¨£¨­ «ì­ extras-addon : %Extras-Addon_version_origA%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_Extras-Addon%"
echo ----------------------------------------------------------
echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode
) else (

    echo ³ ! ERROR: ¥ ã¤ «®áì áª ç âì ä ©« Extras-addon.lua    ! ³
    echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	timeout /t 1 /nobreak >nul
	echo ----------------------------------------------------------
    echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
    choice /c 1 /n
    if errorlevel 1 goto check_offline_mode
			)		 
			
			
:download_ultimate_menu_RU
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º        “áâ ­®¢ª  UltimateMenu ¨§ à¥¯®§¨â®à¨ï         º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul
echo ³ “¤ «¥­¨¥ áâ àëå OLD ¡¥ª ¯®¢...                       ° ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UltimateMenu%.old" >nul 2>&1


if exist "%/Scripts%\%name_UltimateMenu%" (

  echo ³ ¡­ àã¦¥­ UltimateMenu.lua. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_UltimateMenu%" "%name_UltimateMenu%.old"

  echo ³ ¥ª ¯ á®§¤ ­. ‡ £àã§ª  UltimateMenu...                 ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  
  powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "
  
) else (

echo ³ UltimateMenu.lua ­¥ ®¡­ àã¦¥­. —¨áâ ï ãáâ ­®¢ª ...    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
del "%/Scripts%\%name_UltimateMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "

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
del "%/cfg%\%name_txtcfg_UM_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_UM_version%" "%/cfg%\%name_txtcfg_UM_version%" >nul
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo  ‚¥àá¨ï YimMenu : %Ultimate_Menu_version%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?  ’ãâ: %/Scripts%\%name_UltimateMenu%"
echo ----------------------------------------------------------
echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode

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
    if errorlevel 1 goto check_offline_mode 
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

  echo ³ ¡­ àã¦¥­ %name_YimMenu%. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/Downloads%\%name_YimMenu%" "%name_YimMenu%.old"

  echo ³ ¥ª ¯ á®§¤ ­. ‡ £àã§ª  YimMenu...                      ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

  powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YimMenu%' }"
	
) else (

echo ³ YimMenu.dll ­¥ ®¡­ àã¦¥­.      —¨áâ ï ãáâ ­®¢ª ...    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
del "%/Downloads%\%name_YimMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YimMenu%' }"

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
del "%/cfg%\%name_txtcfg_YM_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_YM_version%" "%/cfg%\%name_txtcfg_YM_version%" >nul
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo  ‚¥àá¨ï YimMenu : %YimMenu_version%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?  ’ãâ: %/Downloads%\%name_YimMenu%"
echo ----------------------------------------------------------
echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode

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
    if errorlevel 1 goto check_offline_mode 
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
   powershell -command "& { Invoke-WebRequest -Uri '%FateInjector_orig_Url%' -OutFile '%/Downloads%\%name_FateInjector%' }"
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
goto check_offline_mode 

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
  powershell -command "& { Invoke-WebRequest -Uri '%Xenos64_item_Url%' -OutFile '%/Downloads%\%name_Xenos%' }"
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
goto check_offline_mode )


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
echo [4] ß âªàëâì ¯ ¯ªã /scripts. ’ ¬ áªà¨¯âë-¤®¯®«­¥­¨ï.

choice /c 1234 /n
 if errorlevel 4 goto open_scripts_folder_RU
 if errorlevel 3 goto check_offline_mode
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
echo ³ 3  “áâ ­®¢¨âì ª áâ®¬­ë© Extras-addon                 3 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 4  “¯à ¢«¥­¨¥ ­ áâà®©ª ¬¨ YimMenu (settings.json)    4 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo [5]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
echo ----------------------------------------------------------
echo [6] ß âªàëâì ¯ ¯ªã /YimMenu. Š®à­¥¢ ï ¯ ¯ª  ç¨â-¬¥­î.
@echo.
echo [7] ß ‘ª ç âì YimTools ¢ /Steam/%name_YimTools_Replace%.
echo [8] ß ‘ª ç âì Xenos64 ¢ /Steam/%name_YimTools_Replace%.

choice /c 12345678 /n
 if errorlevel 8 goto put_Xenos_steam
 if errorlevel 7 goto put_YimTools_steam
 if errorlevel 6 goto open_YimMenu_folder_RU
 if errorlevel 5 goto check_offline_mode
 if errorlevel 4 goto choice_settings_RU
 if errorlevel 3 goto download_extras_addon_custom_RU
 if errorlevel 2 goto download_animDictsCompact_RU
 if errorlevel 1 goto download_XML_Maps_RU
 
:optional_downloads_RU_ofline
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º          §«¨ç­ë¥ ¯«îèª¨ (Offline)                        º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo ³ 1 ß âªàëâì ¯ ¯ªã /YimMenu. Š®à­¥¢ ï ¯ ¯ª  ç¨â-¬¥­î.      ß ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 2 ß âªàëâì ¯ ¯ªã /Scripts.  ¯ª  á  ¤¤®­ ¬¨.             ß ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 3 ß âªàëâì ¯ ¯ªã /xml_vehicles.  ¯ª  á XML âà ­á¯®àâ®¬. ß ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo [5]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
echo ----------------------------------------------------------

choice /c 1235 /n
 if errorlevel 5 goto check_offline_mode
 if errorlevel 3 goto open_xml_folder_RU
 if errorlevel 2 goto open_scripts_folder_RU
 if errorlevel 1 goto open_YimMenu_folder_RU


:dwnActVersionsInfo_Table
cls

:: ------------------- Version SETS -------------------------------------------------------------------------------------------------------

          set /p YimTools_version=< %~dp0txtcfg\YT_version.txt >nul 2>&1
		  if not exist "%~dp0txtcfg\YT_version.txt" (
          set "YimTools_version=­¥ ãáâ ­®¢«¥­" )
		  
           set /p YimMenu_version=< %~dp0txtcfg\YM_version.txt >nul 2>&1
		   if not exist "%~dp0txtcfg\YM_version.txt" (
          set "YimMenu_version=­¥ ãáâ ­®¢«¥­" )
		  
		  set /p Extras-Addon_version_qst=< %~dp0txtcfg\EA_version.txt >nul 2>&1
  if not exist "%~dp0txtcfg\EA_version.txt" (
          set /p Extras-Addon_version_qst=< %~dp0txtcfg\EA_md_version.txt >nul 2>&1 )
		  
  set /p Extras-Addon_version_mod=< %~dp0txtcfg\EA_md_version.txt >nul 2>&1
  if not exist "%~dp0txtcfg\EA_md_version.txt" (
          set "Extras-Addon_version_mod=­¥ ãáâ ­®¢«¥­"
		  set /p Extras-Addon_version_qst=< %~dp0txtcfg\EA_version.txt >nul 2>&1 )

		  
     set /p Ultimate_Menu_version=< %~dp0txtcfg\UM_version.txt >nul 2>&1
	 if not exist "%~dp0txtcfg\UM_version.txt" (
          set "Ultimate_Menu_version=­¥ ãáâ ­®¢«¥­" )

:: ----------------------------------------------------------------------------------------------------------------------------------------
	
cls
echo =====================================================================
echo ---------- ’¥ªãé¨¥ ãáâ ­®¢«¥­­ë¥ ¢¥àá¨¨ -----------------------------
echo ---------- ¨  ªâã «ì­ë¥ ¢¥àá¨¨ ­  á ©â¥: ----------------------------
timeout /t 1 /nobreak >nul
echo =====================================================================
echo  “áâ ­®¢«¥­­ ï ¢¥àá¨ï YimTools : %YimTools_version%
echo ---------------------------------------------------------------------
echo  €ªâã «ì­ ï ¢¥àá¨ï YimTools : %YimTools_versionA%
echo =====================================================================
echo  “áâ ­®¢«¥­­ ï ¢¥àá¨ï YimMenu : %YimMenu_version%
echo ---------------------------------------------------------------------
echo  €ªâã «ì­ ï ¢¥àá¨ï YimMenu : %YimMenu_versionA%
echo =====================================================================
echo  “áâ ­®¢«¥­­ ï ¢¥àá¨ï Extras-Addon : %Extras-Addon_version_qst%
echo ---------------------------------------------------------------------
echo  €ªâã «ì­ ï ¢¥àá¨ï Extras-Addon : %Extras-Addon_version_origA%
echo =====================================================================
echo  “áâ ­®¢«¥­­ ï ¢¥àá¨ï UltimateMenu : %Ultimate_Menu_version%
echo ---------------------------------------------------------------------
echo  €ªâã «ì­ ï ¢¥àá¨ï UltimateMenu : %Ultimate_Menu_versionA%
echo =====================================================================

echo [1]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.

choice /c 1 /n
 if errorlevel 1 goto check_offline_mode




:download_XML_Maps_RU
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ âªàëâ¨¥ ááë«ª¨ MagicModz89's MEGA ¢ ¡à ã§¥à¥...                  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 1 /nobreak >nul
start "XML Maps" "%XML_maps_Url%"

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
echo [2] ß âªàëâì ¯ ¯ªã /xml_maps and xml_vehicles.
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

  echo ³ ¡­ àã¦¥­ animDictsCompact. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/YimMenu%\%name_animDictsCompact%" "%name_animDictsCompact%.old"

  echo ³ ¥ª ¯ á®§¤ ­. ‡ £àã§ª  animDictsCompact...             ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  
powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompact_orig_Url%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

) else (

echo ³ animDictsCompact ­¥ ®¡­ àã¦¥­.   —¨áâ ï ãáâ ­®¢ª ...  ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
del "%/YimMenu%\%name_animDictsCompact%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompact_orig_Url%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

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
    if errorlevel 1 goto check_offline_mode 
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
rename "%/YimMenu%\%name_YimMenu-settings%" "%name_YimMenu-settings%.old"
timeout /t 1 /nobreak >nul
goto dwn_settings_noexist
) else (
:dwn_settings_noexist
echo "“áâ ­®¢ª  ª áâ®¬­®£® settings.json ®â  ¢â®à  YimTools..."
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YimMenu-settings%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%settings_item_Url%' -OutFile '%/YimMenu%/%name_YimMenu-settings%' }"

if not exist "%/YimMenu%/%name_YimMenu-settings%" (
		echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« %name_YimMenu-settings%. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥."
	) else (
	    cls
		echo "Š áâ®¬­ë¥ ­ áâà®©ª¨ ãá¯¥è­® ãáâ ­®¢«¥­ë. "
		echo "ƒ¤¥ ä ©«? ’ãâ: %/YimMenu%/%name_YimMenu-settings%"
		echo "Returning to the main menu in 5 seconds." )
timeout /t 5 /nobreak >nul
cls
goto check_offline_mode )

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
echo " ‚®ááâ ­®¢«¥­¨¥ ä ©«  %name_YimMenu-settings% ¯à®è«® “‘…˜ "
timeout /t 2 /nobreak >nul
goto check_offline_mode
) else (
cls
echo " íª ¯ ä ©«  %name_YimMenu-settings% … €‰„… "
timeout /t 3 /nobreak >nul
goto check_offline_mode )

:: //////////////////////////////////////////////////////////////////////
:: \\\\\\\\\\\\\ \\\\\\\\\\\ astions link \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
:: /////////////////////////////////////////////////////////////////////

:open_scripts_folder_RU
start %/Scripts%
goto choice_addons_RU

:open_YimMenu_folder_RU
start %/YimMenu%
goto check_offline_mode

:open_xml_folder_RU
start %/YimMenu%\xml_maps
start %/YimMenu%\xml_vehicles
cls
goto xml_info

:restart_RU
echo "‡ ¯ãáª ­®¢®© ¢¥àá¨¨ YimTools ..."
timeout /t 2 /nobreak >nul
start %name_YimTools%
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

:put_YimTools_steam
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                     ‚ˆŒ€ˆ…                          ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º YimTools ¡ã¤¥â áª ç ­ ¢ ¯ ¯ªã ¯à®£à ¬¬ë %name_YimTools_Replace% (Steam)  º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ‚ë ã¢¥à¥­ë çâ® å®â¨â¥ § ¬¥­¨âì %name_YimTools_Replace% áªà¨¯â®¬?         º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo "” ©« ¡ã¤¥â âãâ:  %/ReplaceFolder%\%name_YimTools_Replace_exe%"
echo ----------------------------------------------------------------------------

set /p yn= ¦¬¨â¥ Y ¢ á«ãç ¥ ¯®«®¦¨â¥«ì­®£® ®â¢¥â :
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%updateScript_club_Url%' -OutFile '%/ReplaceFolder%\%name_YimTools_Replace_exe%' }"

) else (

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º         ‚ëå®¤...            º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
timeout /t 1 /nobreak >nul
exit
)

:put_Xenos_steam
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                     ‚ˆŒ€ˆ…                          ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º Xenos ¡ã¤¥â áª ç ­ ¢ ¯ ¯ªã ¯à®£à ¬¬ë %name_YimTools_Replace% (Steam)     º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ‚ë ã¢¥à¥­ë çâ® å®â¨â¥ § ¬¥­¨âì %name_YimTools_Replace% áªà¨¯â®¬?         º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo "” ©« ¡ã¤¥â âãâ:  %/ReplaceFolder%\%name_YimTools_Replace_exe%"
echo ----------------------------------------------------------------------------

set /p yn= ¦¬¨â¥ Y ¢ á«ãç ¥ ¯®«®¦¨â¥«ì­®£® ®â¢¥â :
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%Xenos64_item_Url%' -OutFile '%/ReplaceFolder%\%name_YimTools_Replace_exe%' }"

) else (

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º         ‚ëå®¤...            º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
timeout /t 1 /nobreak >nul
exit
)

:dwnActVersionsInfo
powershell -command "& { Invoke-WebRequest -Uri '%YM_version_Url%' -OutFile '%/cfga%\%name_txtcfg_YM_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%UM_version_Url%' -OutFile '%/cfga%\%name_txtcfg_UM_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%EA_version_Url%' -OutFile '%/cfga%\%name_txtcfg_EA_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%EA_md_version_Url%' -OutFile '%/cfga%\%name_txtcfg_EA_md_version%' }" >nul
set /a dwnActVersionsStatus=1
goto dwnActVersionsInfo_Done


:here_nothing_now
cls
echo ’ãâ ¯®ª  çâ® ­¨ç¥£® ­¥âã, ¢®§¬®¦­® ¢ ¡ã¤ãé¥¬
echo ¯®ï¢¨âáï ª ª ï-­¨¡ã¤ì ­®¢ ï äã­ªæ¨ï...
timeout /t 2 /nobreak >nul
goto check_offline_mode

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
goto check_offline_mode
:: ------------- YimMenu -------------------------------



:: ------------- Xenos64 -------------------------------


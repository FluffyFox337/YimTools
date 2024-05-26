@ECHO OFF

:: ========================================================================================================================================
:: ===================================== Script's Heading =================================================================================
:: ========================================================================================================================================

   :: ===== File info =====
   :: encoding OEM866 
   :: syntaxis Batch CMD BAT
   :: last edit:26.05.24 / 16:37 msk
   :: last compile:13.05.24 / 16:42 msk
   :: =====================

:: ----------------------- Notes Here -----------------------------------------------------------------------------------------------------

   :: Set environment variables for source and destination paths
   ::   in the code, do not forget the "\" symbol after the %link%
   ::   to set %link% if you need to operate with the root section of the link. 
   ::   Sample: set "link=C\data"   -OutFile '%link%\file.txt'  >> C\data\file.txt
   ::                              -OutFile '%link%file.txt'   >> C\file.txt

   :: C:\Program Files (x86)\Steam\steamapps\common\Soundpad
   
   :: need fix link to download ultimate menu from original repository (error 404 ) = FIXED =
   ::   set "UltimateMenu_orig_Url=https://github.com/L7NEG/Ultimate-Menu/raw/main/YimMenu/Ultimate_Menu%20For%20YimMenu%20V2.1%201.68.lua"   
   ::   UPD-used link shortening


:: === 0111 Search Codes. Navigate at this code. 0111 ===
:: 
:: debug plates -------------------- 1001 1002 1003 1004 1005 1006
:: sets names
:: sets default folders
:: sets custom folders
:: net check ----------------------- 20201
:: menu online --------------------- 20202
::
::
::



:: ========================================================================================================================================
:: ===================================== Script's Settings ================================================================================
:: ========================================================================================================================================


:: ------------------ TRIGGERS ------------------------------------

set /a "offline_mode=0"
set /a "st_start=0"
set /a "skip_update_mode=0"
set /a "blocked_mode=0"
set /a "block_test_YT_v=0"

set /a "develop_mode=0"
set /a "default_mode=0"
set /a "custom_folders_mode=0"
set /a "replaced_mode=0"

set /a "cpne=0"
set /a "cdne=0"
set /a "ymne=0"

:: ------------------ PATHS_SETS --------------------------------
set "/cfg=%APPDATA%\txtcfg"
set "/cfga=%APPDATA%\txtcfg\txtcfga"

set "/trigs=%APPDATA%\txtcfg\trigs"
set "/trigsA=%APPDATA%\txtcfg\txtcfga\trigs"
set "/paths=%APPDATA%\txtcfg\paths"
set "/versions=%APPDATA%\txtcfg\versions"

set "/SF=%~dp0"
set "/YimMenu=%APPDATA%\YimMenu"
set "/Scripts=%APPDATA%\YimMenu\scripts"
set "/scripts_cfg=%APPDATA%\YimMenu\scripts_config"
set "/json_vehicles=%APPDATA%\YimMenu\saved_json_vehicles"
:: .....................................
if not exist "%/cfg%" (
   
   MD "%/trigsA%" >nul
   MD "%/trigs%" >nul
   MD "%/paths%" >nul   
   MD "%/versions%" >nul
   
   rmdir /s /q %/YimMenu%
   

   set "st_start=1"
   :: set /a develop_mode=1
   )
 
REM set last_start_date=%date:~-10%
REM @echo started_data:name.txt>%cfg%\%last_start_date%.txt

if "%develop_mode%"=="1" (
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ 1000                â« ¤ª  âà¨££¥à®¢-¯¥à¥¬¥­­ëå               ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo ------------------------------------------------------------------
@echo.
echo [1] ­ ¦¬¨â¥ ¤«ï ¯à®¤®«¦¥­¨ï...
choice /c 1 /n
 if errorlevel 1 goto cnt1000

)
:cnt1000 

:: ------------------ NAMES_SETS ----------------------------------
set "name_dwn_YT=YimTools_alfa.exe.new"
set "name_YT=YimTools_alfa.exe"

set "name_YT_Replace_exe=­¥ ­ §­ ç¥­"
set "name_YT_Replace=­¥ ­ §­ ç¥­"
 
set "name_Xenos=Xenos64.exe"
set "name_Xenos-instructions=instructions_Xenos.txt"
set "name_FateInjector=FateInjector.exe"

set "name_YM=YimMenu_3179.dll"
set "name_YM-settings=settings.json"

set "name_E-a=Extras-Addon.lua"
set "name_E-j=json.lua"
set "name_E-d=Extras-data.lua"

set "name_UM=Ultimate_Menu For YimMenu V2.1 1.68.lua"
set "name_aDC=animDictsCompact.json"

  :: set "name_cfg_folder=txtcfg"
set "name_txtcfg_YT_version=YT_version.txt"
set "name_txtcfg_YM_version=YM_version.txt"
set "name_txtcfg_UM_version=UM_version.txt"
set "name_txtcfg_EA_version=EA_version.txt"
set "name_txtcfg_EA_md_version=EA_md_version.txt"
set "name_txtcfg_log=log.txt"


 
:: ++++++++++++++++++ Trig_Actions +++++++++++++++++++++++++++++++

:: ---------- txtVAR -----------------
if exist "%/trigs%\gg.txt" (
   set /a blocked_mode=1
   goto blocked )

if exist "%/trigs%\dv_m.txt" (
   set /a develop_mode=1 )

if exist "%/trigs%\cf_m.txt" (
   set /a custom_folders_mode=1
    )
   
if exist "%/trigs%\su_m.txt" (
   set /a skip_update_mode=1 )

:: ----------  -----------------

if "%develop_mode%"=="1" (
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ 1001                â« ¤ª  âà¨££¥à®¢-¯¥à¥¬¥­­ëå               ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo                                             ----------------------
echo cdne:=%cdne%=
echo cpne:=%cpne%=
echo ymne:=%ymne%=
echo ------------------------------------------------------------------
@echo.
echo [1] ­ ¦¬¨â¥ ¤«ï ¯à®¤®«¦¥­¨ï...
choice /c 1 /n
 if errorlevel 1 goto cnt1001

)
:cnt1001 
:: ++++++++++++++++++ Trig_Actions +++++++++++++++++++++++++++++++ 


:: -------------- DEFAULT_PATHS_SETS ------------------------

set "/Downloads=%USERPROFILE%\Downloads"
set "/RF=­¥ ­ §­ ç¥­"
  :: set /RF=< %APPDATA%\txtcfg\versions\YT_version.txt >nul 2>&1


if "%develop_mode%"=="1" (
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ 1002                â« ¤ª  âà¨££¥à®¢-¯¥à¥¬¥­­ëå               ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo                                             ----------------------
echo cdne:=%cdne%=
echo cpne:=%cpne%=
echo ymne:=%ymne%=
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
@echo.
echo [1] ­ ¦¬¨â¥ ¤«ï ¯à®¤®«¦¥­¨ï...
choice /c 1 /n
 if errorlevel 1 goto cnt1002
)

:cnt1002
:: .....................................
if not exist "%/Downloads%" (
   set "/Downloads=%USERPROFILE%\OneDrive\Desktop" )
if not exist "%/Downloads%" (
   set "/Downloads=%USERPROFILE%\Desktop" )

if not exist "%/YimMenu%" set /a ymne=1
		
if "%custom_folders_mode%"=="0" goto skip_cpfs
:: -------------- CUSTOM_PATHS_SETS -------------------------
:cfs
  
if not exist "%/paths%\path_downloads.txt" (
    set /a cdne=1
    )
if not exist "%/paths%\path_replace.txt" (
    set /a cpne=1
    )
if not exist "%/paths%\name_replace.txt" (
    set /a cpne=1
    )



if "%cdne%"=="1" goto skip_cdfs
set /p /Downloads=< %APPDATA%\txtcfg\paths\path_downloads.txt >nul 2>&1
:skip_cdfs
if "%cpne%"=="1" goto skip_cpfs
set /a replaced_mode=1
set /p /RF=< %APPDATA%\txtcfg\paths\path_replace.txt >nul 2>&1
set /p name_YT_Replace_exe=< %APPDATA%\txtcfg\paths\name_replace.txt >nul 2>&1

:skip_cpfs

if "%develop_mode%"=="1" (
@echo.
echo ------------------------------------------------------------------
@echo.

echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ 1003                â« ¤ª  âà¨££¥à®¢-¯¥à¥¬¥­­ëå               ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo cdne:=%cdne%=
echo cpne:=%cpne%=
echo ymne:=%ymne%=
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
@echo.
echo [1] ­ ¦¬¨â¥ ¤«ï ¯à®¤®«¦¥­¨ï...
choice /c 1 /n
 if errorlevel 1 goto cnt1003

)
:cnt1003
:: ================== URL_SETS ================== URL_SETS ================== _URL_SETS ==================================================

:: ------------------ txt cfg ----------------------------------------
set "EA_md_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/EA_md_version.txt"
set "EA_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/EA_version.txt"
set "UM_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/UM_version.txt"
set "YM_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/YM_version.txt"
set "YT_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/YT_version.txt"

:: +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
powershell -command "& { Invoke-WebRequest -Uri '%YT_version_Url%' -OutFile '%/cfga%\%name_txtcfg_YT_version%' }" >nul
if "%develop_mode%"=="0" goto dwnActVersionsOF

powershell -command "& { Invoke-WebRequest -Uri '%YM_version_Url%' -OutFile '%/cfga%\%name_txtcfg_YM_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%UM_version_Url%' -OutFile '%/cfga%\%name_txtcfg_UM_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%EA_version_Url%' -OutFile '%/cfga%\%name_txtcfg_EA_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%EA_md_version_Url%' -OutFile '%/cfga%\%name_txtcfg_EA_md_version%' }" >nul
set /a dwnActVersionsStatus=1
:dwnActVersionsOF
:: +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:: ------------------ Update YimTools --------------------------------
set "updateScript_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"

set "updateScript_club_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa_club.exe"
:: -------------------------------------------------------------------

:: ------------------ items URL_SETS ----------------------

set "Xenos64_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Xenos64.exe"

set "YimMenu_item_Url=https://github.com/FluffyFox337/YimMenu_Actual/raw/master/RELEASE/YimMenu.dll"
set "YimMenu_item_instructions_txt_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/items/instructions_Xenos.txt"

set "settings_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/settings.json"

set "Extras-Addon_item_mod_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Extras-Addon_Modded.lua"
set "UltimateMenu_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Ultimate_Menu_YimMenu-V2.1-1.68.lua"


set "annis_ZR350_anime_drift_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/annis_ZR350_anime_drift.json"
set "karin_sultan_RS_anime_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/karin_sultan_RS_anime.json"
set "futo_GTX_anime_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/futo_GTX_anime.json"
set "ocelot_jugular_anime_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/ocelot_jugular_anime.json"
set "zion_classic_anime_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/zion_classic_anime.json"



:: ------------------ orig URL_SETS ----------------------
                   
set "FateInjector_orig_Url=https://github.com/fligger/FateInjector/releases/download/1.0/FateInjector.exe"

set "Extras-Addon_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-Addon.lua"
set "Extras-Data_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-data.lua"
set "Extras-Json_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/json.lua"

set "UltimateMenu_orig_Url=https://goo.su/aUUeUEl"

set "XML_maps_Url=https://mega.nz/folder/BnM2jQoT#Lb6MG4m24nGv0GkNGsD3sQ"
set "aDC_orig_Url=https://raw.githubusercontent.com/DurtyFree/gta-v-data-dumps/master/animDictsCompact.json"
set "YimActions_orig_Url=https://github.com/xesdoog/YimActions/raw/main/YimActions.lua"
set "YimActions_animdata_orig_Url=https://github.com/xesdoog/YimActions/raw/main/animdata.lua"



:: ------------------- Versions SETS -------------------------------------------------------------------------------------------------------

set /p YT_version=< %APPDATA%\txtcfg\versions\YT_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YT_version.txt" (
  set "YT_version=­¥ ãáâ ­®¢«¥­" )
		  
set /p YM_version=< %APPDATA%\txtcfg\versions\YM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YM_version.txt" (
  set "YM_version=­¥ ãáâ ­®¢«¥­" )

set "EA_version_qst=­¥ ãáâ ­®¢«¥­"		  
  if exist "%APPDATA%\txtcfg\versions\EA_version.txt" (
  set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1 )
  
  if exist "%APPDATA%\txtcfg\versions\EA_md_version.txt" (
  set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_md_version.txt >nul 2>&1 )
		  
set /p UM_version=< %APPDATA%\txtcfg\versions\UM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\UM_version.txt" (
  set "UM_version=­¥ ãáâ ­®¢«¥­" )

set /p YT_versionA=< %APPDATA%\txtcfg\txtcfga\YT_version.txt >nul 2>&1
set /p YM_versionA=< %APPDATA%\txtcfg\txtcfga\YM_version.txt >nul 2>&1
set /p EA_version_origA=< %APPDATA%\txtcfg\txtcfga\EA_version.txt >nul 2>&1
set /p EA_version_modA=< %APPDATA%\txtcfg\txtcfga\EA_md_version.txt >nul 2>&1
set /p UM_versionA=< %APPDATA%\txtcfg\txtcfga\UM_version.txt >nul 2>&1

:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ 1004                â« ¤ª  âà¨££¥à®¢-¯¥à¥¬¥­­ëå               ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 2 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo custom_folders_notExists:=%ctne%=
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo = YT_version:=%YT_version%=
echo = YT_versionA:=%YT_versionA%=
@echo.
echo = YM_version:=%YM_version%=
echo = YM_versionA:=%YM_versionA%=
@echo.
echo = UM_version:=%UM_version%=
echo = UM_versionA:=%UM_versionA%=
echo ========================================
echo = EA_version_qst:=%EA_version_qst%=
echo ========================================
echo = EA_version_origA:=%EA_version_origA%=
echo = EA_version_modA:=%EA_version_modA%=
echo ========================================
@echo.
echo [1] ­ ¦¬¨â¥ ¤«ï ¯à®¤®«¦¥­¨ï...
choice /c 1 /n
 if errorlevel 1 goto cnt1004
)

:cnt1004

if "%st_start%"=="1" (

del "%/Scripts%\%name_UM% >nul 2>&1
del "%/Scripts%\%name_E-a% >nul 2>&1
del "%/Scripts%\%name_E-d% >nul 2>&1
del "%/Scripts%\%name_E-j% >nul 2>&1

)

if "%block_test_YT_v%"=="1" (
set "YT_versionA=blocked"
)
:: +++++++++++++++++++++++++++++++++++++++++
if "%YT_versionA%"=="blocked" goto blocked
:: +++++++++++++++++++++++++++++++++++++++++

:: ========================================================================================================================================
:: ===================================== Net_Check ========================================================================================
:: ========================================================================================================================================


:net_check

set /a "connect_error=0"
set /a "offline_mode=0"

:: --------------------------------------
::20201
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
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
timeout /t 3 /nobreak >nul
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ 1005                â« ¤ª  âà¨££¥à®¢-¯¥à¥¬¥­­ëå               ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo connect_error:=%connect_error%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo custom_folders_notExists:=%ctne%=
echo ------------------------------------------------------------------
@echo.
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo = YT_version:=%YT_version%=
echo = YT_versionA:=%YT_versionA%=
@echo.
echo = YM_version:=%YM_version%=
echo = YM_versionA:=%YM_versionA%=
@echo.
echo = UM_version:=%UM_version%=
echo = UM_versionA:=%UM_versionA%=
echo ========================================
echo = EA_version_qst:=%EA_version_qst%=
echo ========================================
echo = EA_version_origA:=%EA_version_origA%=
echo = EA_version_modA:=%EA_version_modA%=
echo ========================================
@echo.
echo [1] ­ ¦¬¨â¥ ¤«ï ¯à®¤®«¦¥­¨ï...
choice /c 1 /n
 if errorlevel 1 goto cnt1005
)

:cnt1005
timeout /t 3 /nobreak >nul

goto russianscript


:success_net2
 
echo º ?  …áâì ¯à®¡«¥¬ª¨, ­® github ¤®áâã¯¥­                            ? º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
timeout /t 2 /nobreak >nul
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ 1006                â« ¤ª  âà¨££¥à®¢-¯¥à¥¬¥­­ëå               ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo connect_error:=%connect_error%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo custom_folders_notExists:=%ctne%=
echo ------------------------------------------------------------------
@echo.
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo = YT_version:=%YT_version%=
echo = YT_versionA:=%YT_versionA%=
@echo.
echo = YM_version:=%YM_version%=
echo = YM_versionA:=%YM_versionA%=
@echo.
echo = UM_version:=%UM_version%=
echo = UM_versionA:=%UM_versionA%=
echo ========================================
echo = EA_version_qst:=%EA_version_qst%=
echo ========================================
echo = EA_version_origA:=%EA_version_origA%=
echo = EA_version_modA:=%EA_version_modA%=
echo ========================================
@echo.
@echo.
echo [1] ­ ¦¬¨â¥ ¤«ï ¯à®¤®«¦¥­¨ï...
choice /c 1 /n
 if errorlevel 1 goto cnt1006
)
:cnt1006
timeout /t 2 /nobreak >nul

goto russianscript


:success_net

echo º   ˆ­â¥à­¥â á®¥¤¨­¥­¨¥ ¢ ¯®àï¤ª¥                                   º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
timeout /t 2 /nobreak >nul
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ 1007                â« ¤ª  âà¨££¥à®¢-¯¥à¥¬¥­­ëå               ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo connect_error:=%connect_error%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo custom_folders_notExists:=%ctne%=
echo ------------------------------------------------------------------
@echo.
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo = YT_version:=%YT_version%=
echo = YT_versionA:=%YT_versionA%=
@echo.
echo = YM_version:=%YM_version%=
echo = YM_versionA:=%YM_versionA%=
@echo.
echo = UM_version:=%UM_version%=
echo = UM_versionA:=%UM_versionA%=
echo ========================================
echo = EA_version_qst:=%EA_version_qst%=
echo ========================================
echo = EA_version_origA:=%EA_version_origA%=
echo = EA_version_modA:=%EA_version_modA%=
echo ========================================
@echo.
@echo.
echo [1] ­ ¦¬¨â¥ ¤«ï ¯à®¤®«¦¥­¨ï...
choice /c 1 /n
 if errorlevel 1 goto cnt1007
)
:cnt1007

timeout /t 1 /nobreak >nul

goto russianscript
 

:russianscript

:: ========================================================================================================================================
:: ======UPDATE========UPDATE=========UPDATE=======UPDATE======= UPDATE =======UPDATE=========UPDATE==========UPDATE=======================
:: ========================================================================================================================================

:: ------------- Skip update (for debug&develop) -----------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%skip_update_mode%"=="1" goto check_offline_mode

:: ---------------------------------------------------------------------

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º   à®¢¥àª  ­ «¨ç¨ï ­®¢®© ¢¥àá¨¨ %name_YT%...             º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
timeout /t 1 /nobreak >nul

:: del "%/SF%%name_YT%.old" >nul 2>&1

if "%offline_mode%"=="1" (

echo º !           ¡­®¢«¥­¨¥ ­¥¢®§¬®¦­®. Github ­¥¤®áâã¯¥­.            ! º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------
echo  ’¥ªãé ï ¢¥àá¨ï: %YT_version%
timeout /t 1 /nobreak >nul
goto check_offline_mode
) else (

if "%replaced_mode%"=="1" (

:: Compare the current script with the updated version == REPLACED_MODE ==
fc "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
 if errorlevel 1 (
 
    echo ³ ¡­®¢«¥­¨¥ ­ ©¤¥­®! ‡ £àã§ª  ­®¢®© ¢¥àá¨¨ %name_YT% ...      ³
    echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
	
powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/RF%\%name_YT_Replace_exe%.new' }"

    
	:: 6060
    move /y "%/RF%%name_YT_Replace_exe%.new" "%/RF%%name_YT_Replace_exe%" >nul

	del "%/versions%\%name_txtcfg_YT_version%" >nul 2>&1
	move /y "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
	
	
    echo º            à®£à ¬¬  ãá¯¥è­® ®¡­®¢«¥­ !                          º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
    echo ----------------------------------------------------------------------
    echo  ’¥ªãé ï ¢¥àá¨ï: %YT_version%
	echo =====================================
	echo [‚­¨¬ ­¨¥! ‚ª«îç¥­ à¥¦¨¬ § ¬¥é¥­¨ï]
	echo =====================================
	echo [~]  ¥à¥§ ¯ãáª.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (
	
    echo º            “ ¢ á ã¦¥ á ¬ ï ­®¢ ï ¢¥àá¨ï                          º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
    echo ----------------------------------------------------------------------
    echo  ’¥ªãé ï ¢¥àá¨ï: %YT_version%
    timeout /t 1 /nobreak >nul
    goto check_offline_mode
)

)

:: Compare the current script with the updated version 
fc "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
 if errorlevel 1 (
 
    echo ³ ¡­®¢«¥­¨¥ ­ ©¤¥­®! ‡ £àã§ª  ­®¢®© ¢¥àá¨¨ %name_YT% ...      ³
    echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
	
powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/SF%%name_dwn_YT%' }"

    move /y "%/SF%%name_dwn_YT%" "%/SF%%name_YT%" >nul

	del "%/versions%\%name_txtcfg_YT_version%" >nul 2>&1
	move /y "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
	
	
    echo º            à®£à ¬¬  ãá¯¥è­® ®¡­®¢«¥­ !                          º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
    echo ----------------------------------------------------------------------
    echo  ’¥ªãé ï ¢¥àá¨ï: %YT_version%
	echo [~]  ¥à¥§ ¯ãáª.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (
	
    echo º            “ ¢ á ã¦¥ á ¬ ï ­®¢ ï ¢¥àá¨ï                          º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
    echo ----------------------------------------------------------------------
    echo  ’¥ªãé ï ¢¥àá¨ï: %YT_version%
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
echo ³                   ‚¥àá¨ï áªà¨¯â : %YT_version%                         ³
echo ³   ______   ______   ______   ______   ______   ______   ______    ³
echo ³  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    ³
echo ³                                                                   ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo  ‚¥àá¨ï ­  á ©â¥: %YT_versionA%

if "%develop_mode%"=="1" (
echo dwnActVersionsStatus:=%dwnActVersionsStatus%= )
echo ---------------------------------------------------------------------
echo   â  ¯à®£à ¬¬  ã¯à®áâ¨â ¯à®æ¥áá áª ç¨¢ ­¨ï á¢¥¦¨å ¢¥àá¨© YimMenu,
echo   áªà¨¯â®¢ ª ­¥¬ã ¨ ¢®§¬®¦­® ¤àã£¨å ¯à¨ïâ­ëå ¯«îè¥ª. 
echo                   ~ ®«ì§ã©â¥áì á ã¤®¢®«ìáâ¢¨¥¬ ~
@echo.
echo                               ¬®¤®¤¥«-«î¡¨â¥«ì ¨ª®« © (FluffyFox337)
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
::20202
echo ---------------------------------------------------------------------
echo 			ƒ« ¢­®¥ ¬¥­î
echo ---------------------------------------------------------------------
if "%replaced_mode%"=="1" (
echo ---------------------------------------------------------------------
echo  €ªâ¨¢¨à®¢ ­ à¥¦¨¬ § ¬¥é¥­¨ï 
echo ---------------------------------------------------------------------
)
if "%ymne%"=="1" (
echo ---------------------------------------------------------------------
echo   ¯ª  YimMenu ­¥ ®¡­ àã¦¥­ , § ¯ãáâ¨â¥ ç¨â ¨ ¯¥à¥§ ¯ãáâ¨â¥ YimTools.  
@echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³             ‘¥©ç á ãáâ ­®¢ª   ¤¤®­®¢ ­¥¢®§¬®¦­ !               ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
@echo.
start %/YimMenu%
echo ---------------------------------------------------------------------
)

echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                         ƒ« ¢­®¥ ¬¥­î                            º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 1 ‘ª ç âì-ãáâ ­®¢¨âì (ç¨â,¨­¦¥ªâ®à, ¤¤®­ë)                      1 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 2 „®¯®«­¨â¥«ì­ë¥ ¯«îèª¨ (’à ­á¯®àâ,¨¬¯®àâ ­ áâà®¥ª ¨ ¤à...)     2 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 3  áâà®©ª¨                                                     3 º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo [8] ˆ­áâàãªæ¨ï ¯® § ¯ãáªã ç¨â .
echo [9] ‚ë©â¨ ¨§ ¯à®£à ¬¬ë.
echo ---------------------------------------------------------------------
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ …á«¨ ¯ ¯ª  § £àã§®ª ­ å®¤¨âáï ­¥ ¢ ­ã¦­®¬ ¬¥áâ¥ ¨«¨ ¥ñ ­¥âã,   ³
echo ³  â®£¤  ¯® ã¬®«ç ­¨î § £àã§ª¨ ¡ã¤ãâ ­  à ¡®ç¥¬ áâ®«¥.           ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

choice /c 12389 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 3 goto menu_settings
 if errorlevel 2 goto optional_downloads_RU
 if errorlevel 1 goto menu_downloads



:menu_offline_RU
cls
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³   ______   ______   ______   ______   ______   ______   ______    ³
echo ³  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    ³
echo ³                                                                   ³
echo ³  //OFFLINE//          YimTools exe edition           //OFFLINE//  ³
echo ³                                                                   ³
echo ³                   ‚¥àá¨ï áªà¨¯â : %YT_version%                         ³
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
echo                               ¬®¤®¤¥«-«î¡¨â¥«ì ¨ª®« © (FluffyFox337)
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
echo º 1 €‘’‰Šˆ                                                     1 º
echo Ç===================================================================¶
echo º ! “ ¢ á ­¥â ¨­â¥à­¥â á®¥¤¨­¥­¨ï, ¯®íâ®¬ã âãâ ¬ «® ¯ã­ªâ®¢...    ! º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo [8] ˆ­áâàãªæ¨ï ¯® § ¯ãáªã ç¨â .
echo [9] ‚ë©â¨ ¨§ ¯à®£à ¬¬ë.
echo ---------------------------------------------------------------------
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ …á«¨ ¯ ¯ª  § £àã§®ª ­ å®¤¨âáï ­¥ ¢ ­ã¦­®¬ ¬¥áâ¥ ¨«¨ ¥ñ ­¥âã,   ³
echo ³  â®£¤  ¯® ã¬®«ç ­¨î § £àã§ª¨ ¡ã¤ãâ ­  à ¡®ç¥¬ áâ®«¥.           ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

choice /c 189 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 1 goto menu_settings


:menu_downloads
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ?           ‚ë¡¥à¨ çâ® å®ç¥èì á¤¥« âì                           ? º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo º 1 ‘ª ç âì ¯à®£à ¬¬ã-¨­¦¥ªâ®à                                    1 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 2 ‘ª ç âì ç¨â ¬¥­î YimMenu                                      2 º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º 3 “áâ ­®¢¨âì ¤®¯®«­¥­¨ï-áªà¨¯âë ¤«ï YimMenu                     3 º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo [8] ˆ­áâàãªæ¨ï ¯® § ¯ãáªã ç¨â .
echo [9] ‚¥à­ãâìáï ¢ £« ¢­®¥ ¬¥­î.
echo ---------------------------------------------------------------------
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ …á«¨ ¯ ¯ª  § £àã§®ª ­ å®¤¨âáï ­¥ ¢ ­ã¦­®¬ ¬¥áâ¥ ¨«¨ ¥ñ ­¥âã,   ³
echo ³  â®£¤  ¯® ã¬®«ç ­¨î § £àã§ª¨ ¡ã¤ãâ ­  à ¡®ç¥¬ áâ®«¥.           ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

choice /c 12389 /n
 if errorlevel 9 goto check_offline_mode
 if errorlevel 8 goto instructions_RU
 if errorlevel 3 goto choice_addons_RU
 if errorlevel 2 goto download_yimmenu_RU
 if errorlevel 1 goto choice_injectors_RU

:menu_settings
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ß                          €‘’‰Šˆ                            ß º
echo ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo ³ 1 ç¨áâ¨âì ¯ ¯ªã ª¥è  YimMenu (¡ëáâàë© ä¨ªá ¯®á«¥ ®¡­®¢ë GTA V) 1 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 2 ’ ¡«¨æ   ªâã «ì­®áâ¨ ¢¥àá¨© (¯à®¢¥àì ­¥ ãáâ à¥«¨ «¨ ç¨âë)     2 ³
echo ÃÄÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄ´
echo ³ 3 âªàëâì ¯ ¯ªã /YimTools.  ¯ª  á ª®­ä¨£ãà æ¨ï¬¨.              3 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 4 âªàëâì ¯ ¯ªã /Scripts.  ¯ª  á  ¤¤®­ ¬¨.                     4 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 5 âªàëâì ¯ ¯ª¨ /xml_vehicles-maps.  ¯ª  á XML ª®­â¥­â®¬.      5 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 6 âªàëâì ¯ ¯ªã /json_vehicles.  ¯ª  á JSON âà ­á¯®àâ®¬.       6 ³
echo ÃÄÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÄ´
echo ³ 7 ß ‘¡à®á ­ áâà®¥ª ¨ ã¤ «¥­¨¥ ¢á¥å ä ©«®¢ YM ¨ YM.            ß 7 ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo ---------------------------------------------------------------------
echo [8] ˆ­áâàãªæ¨ï ¯® § ¯ãáªã ç¨â .
echo [9] ‚¥à­ãâìáï ¢ £« ¢­®¥ ¬¥­î.
echo ---------------------------------------------------------------------
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ …á«¨ ¯ ¯ª  § £àã§®ª ­ å®¤¨âáï ­¥ ¢ ­ã¦­®¬ ¬¥áâ¥ ¨«¨ ¥ñ ­¥âã,   ³
echo ³  â®£¤  ¯® ã¬®«ç ­¨î § £àã§ª¨ ¡ã¤ãâ ­  à ¡®ç¥¬ áâ®«¥.           ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

choice /c 123456789 /n
 if errorlevel 9 goto check_offline_mode
 if errorlevel 8 goto instructions_RU
 if errorlevel 7 goto reset
 if errorlevel 6 goto open_json_folder_RU
 if errorlevel 5 goto open_xml_folder_RU
 if errorlevel 4 goto open_scripts_folder_RU
 if errorlevel 3 goto open_YT_folder_RU
 if errorlevel 2 goto dwnActVersionsInfo_Table
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
del "%/Scripts%\%name_E-a%.old" >nul 2>&1
del "%/Scripts%\%name_E-j%.old" >nul 2>&1
del "%/Scripts%\%name_E-d%.old" >nul 2>&1

timeout /t 1 /nobreak >nul


if exist "%/Scripts%\%name_E-a%" (

  echo ³ ¡­ àã¦¥­ Extras-Addon.lua. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_E-a%" "%name_E-a%.old"
  rename "%/Scripts%\%name_E-j%" "%name_E-j%.old"
  rename "%/Scripts%\%name_E-d%" "%name_E-d%.old"
  
  echo ³ ¥ª ¯ á®§¤ ­. “áâ ­®¢ª  Extras-Addon...                ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_orig_Url%' -OutFile '%/Scripts%\%name_E-a%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Json_orig_Url%' -OutFile '%/Scripts%\%name_E-j%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Data_orig_Url%' -OutFile '%/Scripts%\%name_E-d%' }"
  
) else (
	  
    echo ³ Extras-Addon.lua ­¥ ®¡­ àã¦¥­. —¨áâ ï ãáâ ­®¢ª ...     ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
    del "%/Scripts%\%name_E-a%" >nul 2>&1
	del "%/Scripts%\%name_E-j%" >nul 2>&1
    del "%/Scripts%\%name_E-d%" >nul 2>&1
      
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_orig_Url%' -OutFile '%/Scripts%\%name_E-a%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Json_orig_Url%' -OutFile '%/Scripts%\%name_E-j%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Data_orig_Url%' -OutFile '%/Scripts%\%name_E-d%' }"
	  
	timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_E-a%" (

  if exist "%/Scripts%\%name_E-j%" (
  goto continue_dwn_extras_addon 
  
  ) else (
	echo ³ ! ERROR: ¥ ã¤ «®áì áª ç âì ä ©« json.lua            ! ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	timeout /t 2 /nobreak >nul
	              
	echo ³ ! ‚®ááâ ­®¢«¥­¨¥ ¡¥ª ¯ ...                           ! ³
    echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_E-a%" >nul 2>&1
	del "%/Scripts%\%name_E-j%" >nul 2>&1
    del "%/Scripts%\%name_E-d%" >nul 2>&1
	
    rename "%/Scripts%\%name_E-a%.old" %name_E-a%
    rename "%/Scripts%\%name_E-j%.old" %name_E-j%
    rename "%/Scripts%\%name_E-d%.old" %name_E-d%
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
  del "%/Scripts%\%name_E-a%" >nul 2>&1
  del "%/Scripts%\%name_E-j%" >nul 2>&1
  del "%/Scripts%\%name_E-d%" >nul 2>&1
  
  rename "%/Scripts%\%name_E-a%.old" %name_E-a%
  rename "%/Scripts%\%name_E-j%.old" %name_E-j%
  rename "%/Scripts%\%name_E-d%.old" %name_E-d%
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
					   
if exist "%/Scripts%\%name_E-d%" (
  goto download_extras_addon_RU_Success 
  
  ) else (
	echo ³ ! ERROR: ¥ ã¤ «®áì áª ç âì ä ©« Extras-data.lua     ! ³
    echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	timeout /t 1 /nobreak >nul
						
	echo ³ ! ‚®ááâ ­®¢«¥­¨¥ %name_E-d%...               ! ³
    echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	@echo.
	rename "%/Scripts%\%name_E-d%.old" %name_E-d%
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
del "%/Scripts%\%name_E-a%.old" >nul 2>&1
del "%/Scripts%\%name_E-j%.old" >nul 2>&1
del "%/Scripts%\%name_E-d%.old" >nul 2>&1
				 
				 
echo º ‘ªà¨¯â Extras-addon ãá¯¥è­® ãáâ ­®¢«¥­.               º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
del "%/versions%\%name_txtcfg_EA_md_version%" >nul 2>&1
del "%/versions%\%name_txtcfg_EA_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_version%" "%/versions%\%name_txtcfg_EA_version%" >nul
timeout /t 1 /nobreak >nul

set /p Extras-Addon_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1

echo ----------------------------------------------------------
echo  ‚¥àá¨ï extras-addon : %Extras-Addon_version_qst%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_E-a%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_E-j%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_E-d%"
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
del "%/Scripts%\%name_E-a%.old" >nul 2>&1
del "%/Scripts%\%name_E-j%.old" >nul 2>&1
del "%/Scripts%\%name_E-d%.old" >nul 2>&1
				 
				 
echo º! ‘ªà¨¯â Extras-addon “‘‹‚ ãá¯¥è­® ãáâ ­®¢«¥­.     ! º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
del "%/versions%\%name_txtcfg_EA_md_version%" >nul 2>&1
del "%/versions%\%name_txtcfg_EA_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_version%" "%/versions%\%name_txtcfg_EA_version%" >nul
timeout /t 1 /nobreak >nul
set /p Extras-Addon_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1
echo ----------------------------------------------------------
echo  ‚¥àá¨ï extras-addon : %Extras-Addon_version_qst%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_E-a%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_E-j%"
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_E-d%"
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
del "%/Scripts%\%name_E-a%" >nul 2>&1

echo ³ ‡ £àã§ª  ª áâ®¬­®£® Extras-Addon...                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_item_mod_Url%' -OutFile '%/Scripts%\%name_E-a%' }"

if exist "%/Scripts%\%name_E-a%" (

echo º Š áâ®¬­ë© Extras-addon ãá¯¥è­® ãáâ ­®¢«¥­.            º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.

del "%/versions%\%name_txtcfg_EA_version%" >nul 2>&1
del "%/versions%\%name_txtcfg_EA_md_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_md_version%" "%/versions%\%name_txtcfg_EA_md_version%" >nul
set /p Extras-Addon_version_qst=< %APPDATA%\txtcfg\versions\EA_md_version.txt >nul 2>&1

timeout /t 1 /nobreak >nul

echo ----------------------------------------------------------
echo  ‚¥àá¨ï ª áâ®¬­®£® extras-addon : %Extras-Addon_version_qst%
echo  ‚¥àá¨ï ®à¨£¨­ «ì­ extras-addon : %Extras-Addon_version_origA%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?   ’ãâ: %/Scripts%\%name_E-a%"
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
del "%/Scripts%\%name_UM%.old" >nul 2>&1


if exist "%/Scripts%\%name_UM%" (

  echo ³ ¡­ àã¦¥­ UltimateMenu.lua. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_UM%" "%name_UM%.old"

  echo ³ ¥ª ¯ á®§¤ ­. ‡ £àã§ª  UltimateMenu...                 ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  
  powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UM%' } "
  
) else (

echo ³ UltimateMenu.lua ­¥ ®¡­ àã¦¥­. —¨áâ ï ãáâ ­®¢ª ...    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
del "%/Scripts%\%name_UM%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UM%' } "

timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_UM%" (

timeout /t 1 /nobreak >nul
echo ³ UltimateMenu.lua ãá¯¥è­® § £àã¦¥­.                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	             
timeout /t 1 /nobreak >nul
echo ³  “¤ «¥­¨¥ ¡¥ª ¯ ...                                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UM%.old" >nul 2>&1
				 
				 
echo º ‘ªà¨¯â UltimateMenu ãá¯¥è­® ãáâ ­®¢«¥­.               º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
del "%/versions%\%name_txtcfg_UM_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_UM_version%" "%/versions%\%name_txtcfg_UM_version%" >nul
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo  ‚¥àá¨ï YimMenu : %Ultimate_Menu_version%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?  ’ãâ: %/Scripts%\%name_UM%"
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
    del "%/Scripts%\%name_UM%" >nul 2>&1
    rename "%/Scripts%\%name_UM%.old" %name_UM%

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
del "%/Downloads%\%name_YM%.old" >nul 2>&1

if exist "%/Downloads%\%name_YM%" (

  echo ³ ¡­ àã¦¥­ %name_YM%. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/Downloads%\%name_YM%" "%name_YM%.old"

  echo ³ ¥ª ¯ á®§¤ ­. ‡ £àã§ª  YimMenu...                      ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

  powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YM%' }"
	
) else (

echo ³ YimMenu.dll ­¥ ®¡­ àã¦¥­.      —¨áâ ï ãáâ ­®¢ª ...    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
del "%/Downloads%\%name_YM%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YM%' }"

timeout /t 3 /nobreak >nul )

if exist "%/Downloads%\%name_YM%" (

timeout /t 1 /nobreak >nul
echo ³ YimMenu.dll ãá¯¥è­® § £àã¦¥­.                         ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	             
timeout /t 1 /nobreak >nul
echo ³  “¤ «¥­¨¥ ¡¥ª ¯ ...                                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YM%.old" >nul 2>&1
				 
				 
echo º —¨â-¬¥­î  YimMenu ãá¯¥è­® ãáâ ­®¢«¥­.                 º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
del "%/versions%\%name_txtcfg_YM_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_YM_version%" "%/versions%\%name_txtcfg_YM_version%" >nul
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo  ‚¥àá¨ï YimMenu : %YM_version%
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?  ’ãâ: %/Downloads%\%name_YM%"
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
    del "%/Downloads%\%name_YM%" >nul 2>&1
    rename "%/Downloads%\%name_YM%.old" %name_YM%

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
echo [7] ß âªàëâì ¯ ¯ªã /YimTools.  ¯ª  á ª®­ä¨£ãà æ¨ï¬¨.
@echo.
echo [8] ß ‘ª ç âì YimTools ¢ %RF%/%name_YT_Replace_exe%
echo [9] ß ‘ª ç âì Xenos64 ¢ %RF%/%name_YT_Replace_exe%

choice /c 123456789 /n
 if errorlevel 9 goto put_Xenos_R
 if errorlevel 8 goto put_YimTools_R
 if errorlevel 7 goto open_YT_folder_RU
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
echo ³ 1 ß âªàëâì ¯ ¯ªã /YimTools.  ¯ª  á ª®­ä¨£ãà æ¨ï¬¨.      ß ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 2 ß âªàëâì ¯ ¯ªã /YimMenu. Š®à­¥¢ ï ¯ ¯ª  ç¨â-¬¥­î.      ß ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 3 ß âªàëâì ¯ ¯ªã /Scripts.  ¯ª  á  ¤¤®­ ¬¨.             ß ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ 4 ß âªàëâì ¯ ¯ªã /xml_vehicles.  ¯ª  á XML âà ­á¯®àâ®¬. ß ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo [5]  ‚ë©â¨ ¢ £« ¢­®¥ ¬¥­î.
echo ----------------------------------------------------------

choice /c 1235 /n
 if errorlevel 5 goto check_offline_mode
 if errorlevel 4 goto open_xml_folder_RU
 if errorlevel 3 goto open_scripts_folder_RU
 if errorlevel 2 goto open_YimMenu_folder_RU
 if errorlevel 1 goto open_YT_folder_RU


:dwnActVersionsInfo_Table
cls

:: ------------------- Versions SETS -------------------------------------------------------------------------------------------------------

set /p YT_version=< %APPDATA%\txtcfg\versions\YT_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YT_version.txt" (
  set "YT_version=­¥ ãáâ ­®¢«¥­" )
		  
set /p YM_version=< %APPDATA%\txtcfg\versions\YM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YM_version.txt" (
  set "YM_version=­¥ ãáâ ­®¢«¥­" )
		  
set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\EA_version.txt" (
  set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_md_version.txt >nul 2>&1 )
		   
  if not exist "%APPDATA%\txtcfg\versions\EA_md_version.txt" (
  set "EA_version_qst=­¥ ãáâ ­®¢«¥­" )
		  
set /p UM_version=< %APPDATA%\txtcfg\versions\UM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\UM_version.txt" (
  set "UM_version=­¥ ãáâ ­®¢«¥­" )

set /p YT_versionA=< %APPDATA%\txtcfg\txtcfga\YT_version.txt >nul 2>&1
set /p YM_versionA=< %APPDATA%\txtcfg\txtcfga\YM_version.txt >nul 2>&1
set /p EA_version_origA=< %APPDATA%\txtcfg\txtcfga\EA_version.txt >nul 2>&1
set /p EA_version_modA=< %APPDATA%\txtcfg\txtcfga\EA_md_version.txt >nul 2>&1
set /p UM_versionA=< %APPDATA%\txtcfg\txtcfga\UM_version.txt >nul 2>&1

:: ----------------------------------------------------------------------------------------------------------------------------------------
	
cls
echo =====================================================================
echo ----           ’¥ªãé¨¥ ãáâ ­®¢«¥­­ë¥ ¢¥àá¨¨                      ----
echo ----           ¨  ªâã «ì­ë¥ ¢¥àá¨¨ ­  á ©â¥:                     ----
echo ---------------------------------------------------------------------
timeout /t 1 /nobreak >nul
@echo.
@echo.
echo =====================================================================
echo  “áâ ­®¢«¥­­ ï ¢¥àá¨ï YimTools : %YT_version%
echo ---------------------------------------------------------------------
echo  €ªâã «ì­ ï ¢¥àá¨ï YimTools : %YT_versionA%
echo =====================================================================
@echo.
echo =====================================================================
echo  “áâ ­®¢«¥­­ ï ¢¥àá¨ï YimMenu : %YM_version%
echo ---------------------------------------------------------------------
echo  €ªâã «ì­ ï ¢¥àá¨ï YimMenu : %YM_versionA%
echo =====================================================================
@echo.
echo =====================================================================
echo  “áâ ­®¢«¥­­ ï ¢¥àá¨ï Extras-Addon : %EA_version_qst%
echo ---------------------------------------------------------------------
echo  €ªâã «ì­ ï ¢¥àá¨ï Extras-Addon : %EA_version_origA%
echo =====================================================================
@echo.
echo =====================================================================
@echo.
echo =====================================================================
echo  “áâ ­®¢«¥­­ ï ¢¥àá¨ï UltimateMenu : %UM_version%
echo ---------------------------------------------------------------------
echo  €ªâã «ì­ ï ¢¥àá¨ï UltimateMenu : %UM_versionA%
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
del "%/YimMenu%\%name_aDC%.old" >nul 2>&1

if exist "%/YimMenu%\%name_aDC%" (

  echo ³ ¡­ àã¦¥­ animDictsCompact. ‘®§¤ ­¨¥ ­®¢®£® ¡¥ª ¯ ...  ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  timeout /t 2 /nobreak >nul
  rename "%/YimMenu%\%name_aDC%" "%name_aDC%.old"

  echo ³ ¥ª ¯ á®§¤ ­. ‡ £àã§ª  animDictsCompact...             ³
  echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
  
powershell -command "& { Invoke-WebRequest -Uri '%aDC_orig_Url%' -OutFile '%/YimMenu%/%name_aDC%' }"

) else (

echo ³ animDictsCompact ­¥ ®¡­ àã¦¥­.   —¨áâ ï ãáâ ­®¢ª ...  ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	  
del "%/YimMenu%\%name_aDC%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%aDC_orig_Url%' -OutFile '%/YimMenu%/%name_aDC%' }"

timeout /t 3 /nobreak >nul )

if exist "%/YimMenu%\%name_aDC%" (

timeout /t 1 /nobreak >nul
echo ³ animDictsCompact ãá¯¥è­® § £àã¦¥­.                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
	             
timeout /t 1 /nobreak >nul
echo ³  “¤ «¥­¨¥ ¡¥ª ¯ ...                                    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_aDC%.old" >nul 2>&1
				 
				 
echo º  §  ¤ ­­ëå  ­¨¬ æ¨© ãá¯¥è­® ãáâ ­®¢«¥­ .             º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "ƒ¤¥ ä ©«?  ’ãâ: %/YimMenu%/%name_aDC%"
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
    del "%/YimMenu%\%name_aDC%" >nul 2>&1
    rename "%/YimMenu%\%name_aDC%.old" %name_aDC%

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

if exist "%/YimMenu%/%name_YM-settings%" (

echo "¥ª ¯ ã¦¥ áãé¥áâ¢ãîé¨å ­ áâà®¥ª settings.json ..."
timeout /t 2 /nobreak >nul
rename "%/YimMenu%\%name_YM-settings%" "%name_YM-settings%.old"
timeout /t 1 /nobreak >nul
goto dwn_settings_noexist
) else (
:dwn_settings_noexist
echo "“áâ ­®¢ª  ª áâ®¬­®£® settings.json ®â  ¢â®à  YimTools..."
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YM-settings%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%settings_item_Url%' -OutFile '%/YimMenu%/%name_YM-settings%' }"

if not exist "%/YimMenu%/%name_YM-settings%" (
		echo "Error: ¥ ã¤ «®áì áª ç âì ä ©« %name_YM-settings%. à®¢¥àìâ¥ ­ «¨ç¨¥ ¨­â¥à­¥â á®¥¤¨­¥­¨ï ¨«¨  ªâã «ì­®áâì ááë«ª¨ ­  ä ©« ¢ ª®¤¥."
	) else (
	    cls
		echo "Š áâ®¬­ë¥ ­ áâà®©ª¨ ãá¯¥è­® ãáâ ­®¢«¥­ë. "
		echo "ƒ¤¥ ä ©«? ’ãâ: %/YimMenu%/%name_YM-settings%"
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
if exist "%/YimMenu%/%name_YM-settings%.old" (
echo " ‚ë¯®«­ï¥âáï ¢®ááâ ­®¢«¥­¨¥ ä ©«  settigs.json... "
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YM-settings%" >nul 2>&1
rename "%/YimMenu%\%name_YM-settings%.old" %name_YM-settings%
if exist "%/YimMenu%/%name_YM-settings%" (
echo " ‚®ááâ ­®¢«¥­¨¥ ä ©«  %name_YM-settings% ¯à®è«® “‘…˜ "
) else (
echo " ‚®ááâ ­®¢«¥­¨¥ ä ©«  %name_YM-settings% … “„€‹‘œ " )
timeout /t 2 /nobreak >nul
goto check_offline_mode
) else (
cls
echo " íª ¯ ä ©«  %name_YM-settings% … €‰„… "
timeout /t 3 /nobreak >nul
goto check_offline_mode )

:: //////////////////////////////////////////////////////////////////////
:: \\\\\\\\\\\\\ \\\\\\\\\\\ astions link \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
:: /////////////////////////////////////////////////////////////////////

:open_YT_folder_RU
start %/cfg%
goto menu_settings

:open_scripts_folder_RU
start %/Scripts%
goto menu_settings

:open_YimMenu_folder_RU
start %/YimMenu%
goto menu_settings

:open_xml_folder_RU
start %/YimMenu%\xml_maps
start %/YimMenu%\xml_vehicles
cls
goto menu_settings

:open_json_folder_RU
start %/json_vehicles%
cls
goto menu_settings

:restart_RU
echo "‡ ¯ãáª ­®¢®© ¢¥àá¨¨ YimTools ..."
timeout /t 2 /nobreak >nul
start %name_YT%
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

:put_YimTools_R
cls
if "%/RF%"=="­¥ ­ §­ ç¥­" (
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                     ‚ˆŒ€ˆ…                          ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º ¯ãâì § ¬¥­ë ­¥ ­ §­ ç¥­. à®¢¥àìâ¥ txt ª®­ä¨£ãà æ¨î       º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo ” ©« âãâ:  %/paths%\path_replace.txt
echo ----------------------------------------------------------------------------
@echo.
echo ============================================================================
echo [1]  ¦¬¨â¥ 1 ¤«ï ¢ëå®¤  ¢ £« ¢­®¥ ¬¥­î ...
echo [2]  ¦¬¨â¥ 2 ¤«ï ®âªàëâ¨ï ä ©«  ª®­ä¨£ãà æ¨¨ ...

choice /c 12 /n
 if errorlevel 2 start %/paths%\path_replace.txt
 if errorlevel 1 goto check_offline_mode
 
)

if "%name_YT_Replace_exe%"=="­¥ ­ §­ ç¥­" (
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                     ‚ˆŒ€ˆ…                          ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º ˆ¬ï § ¬¥­ë ­¥ ­ §­ ç¥­®. à®¢¥àìâ¥ txt ª®­ä¨£ãà æ¨î       º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo ” ©« âãâ:  %/paths%\name_replace.txt
echo ----------------------------------------------------------------------------
@echo.
echo ============================================================================
echo [1]  ¦¬¨â¥ 1 ¤«ï ¢ëå®¤  ¢ £« ¢­®¥ ¬¥­î ...
echo [2]  ¦¬¨â¥ 2 ¤«ï ®âªàëâ¨ï ä ©«  ª®­ä¨£ãà æ¨¨ ...

choice /c 12 /n
 if errorlevel 2 start %/paths%\name_replace.txt exit
 if errorlevel 1 goto check_offline_mode
)


echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                     ‚ˆŒ€ˆ…                          ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º YimTools § ¬¥­¨â á®¡®© ãª § ­­ãî ¢ ª®­ä¨£ãà æ¨¨ ¯à®£à ¬¬ã º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ‚ë ã¢¥à¥­ë çâ® å®â¨â¥ § ¬¥­¨âì %name_YT_Replace_exe% áªà¨¯â®¬?         º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo ” ©« ¡ã¤¥â âãâ:  %/RF%\%name_YT_Replace_exe%
echo ----------------------------------------------------------------------------

set /p yn= ¦¬¨â¥ Y ¢ á«ãç ¥ ¯®«®¦¨â¥«ì­®£® ®â¢¥â :
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/RF%\%name_YT_Replace_exe%' }"

timeout /t 1 /nobreak >nul
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º    “á¯¥è­® § £àã¦¥­®        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
timeout /t 1 /nobreak >nul
exit
) else (

cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º         ‚ëå®¤...            º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
timeout /t 1 /nobreak >nul
exit
)

:put_Xenos_R
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                     ‚ˆŒ€ˆ…                          ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º Xenos ¡ã¤¥â áª ç ­ ¢ ¯ ¯ªã ¯à®£à ¬¬ë %name_YT_Replace_exe% º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º ‚ë ã¢¥à¥­ë çâ® å®â¨â¥ § ¬¥­¨âì %name_YT_Replace_exe% áªà¨¯â®¬?         º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ----------------------------------------------------------------------------
echo "” ©« ¡ã¤¥â âãâ:  %/RF%\%name_YT_Replace_exe%"
echo ----------------------------------------------------------------------------

set /p yn= ¦¬¨â¥ Y ¢ á«ãç ¥ ¯®«®¦¨â¥«ì­®£® ®â¢¥â :
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%Xenos64_item_Url%' -OutFile '%/RF%\%name_YT_Replace_exe%' }"

timeout /t 1 /nobreak >nul
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º    “á¯¥è­® § £àã¦¥­®        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
timeout /t 1 /nobreak >nul
exit

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

:reset
cls
rmdir /s /q %/YimMenu%
rmdir /s /q %/cfg%
timeout /t 1 /nobreak >nul
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º   ‘¡à®á ­ áâà®¥ª ¢ë¯®«­¥­   º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
timeout /t 1 /nobreak >nul
echo ===============================
goto goodbye_RU

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

:blocked
cls

echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º !                     ‚ˆŒ€ˆ…                          ! º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º ‘¥©ç á ¯®«ì§®¢ âìáï ç¨â ¬¥­î ­¥¡¥§®¯ á­®.                 º
echo º à®£à ¬¬  § ¡«®ª¨à®¢ ­  ¤® ¯®ï¢«¥­¨¥ ¡¥§®¯ á­®© ®¡­®¢ë.   º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
@echo.
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ ~        ‘¯ á¨¡® §  ¨á¯®«ì§®¢ ­¨¥ YimTools,       ~ ³
echo ³ ~                à¨ïâ­®© ¨£àë!                   ~ ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
timeout /t 5 /nobreak >nul
exit

:auto_mode_RU
cls
goto check_offline_mode
:: ------------- YimMenu -------------------------------



:: ------------- Xenos64 -------------------------------


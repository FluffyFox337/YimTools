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
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 1000                롡쳽ㄺ� 循ª％昔�-��誓Д��音               �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
echo [1] 췅━ⓥ� ㄻ� �昔ㄾウ��⑨...
choice /c 1 /n
 if errorlevel 1 goto cnt1000

)
:cnt1000 

:: ------------------ NAMES_SETS ----------------------------------
set "name_dwn_YT=YimTools_alfa.exe.new"
set "name_YT=YimTools_alfa.exe"

set "name_YT_Replace_exe=�� 췅㎛좂��"
set "name_YT_Replace=�� 췅㎛좂��"
 
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
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 1001                롡쳽ㄺ� 循ª％昔�-��誓Д��音               �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
echo [1] 췅━ⓥ� ㄻ� �昔ㄾウ��⑨...
choice /c 1 /n
 if errorlevel 1 goto cnt1001

)
:cnt1001 
:: ++++++++++++++++++ Trig_Actions +++++++++++++++++++++++++++++++ 


:: -------------- DEFAULT_PATHS_SETS ------------------------

set "/Downloads=%USERPROFILE%\Downloads"
set "/RF=�� 췅㎛좂��"
  :: set /RF=< %APPDATA%\txtcfg\versions\YT_version.txt >nul 2>&1


if "%develop_mode%"=="1" (
cls
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 1002                롡쳽ㄺ� 循ª％昔�-��誓Д��音               �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
echo [1] 췅━ⓥ� ㄻ� �昔ㄾウ��⑨...
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

echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 1003                롡쳽ㄺ� 循ª％昔�-��誓Д��音               �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
echo [1] 췅━ⓥ� ㄻ� �昔ㄾウ��⑨...
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
  set "YT_version=�� 信�젺�˙��" )
		  
set /p YM_version=< %APPDATA%\txtcfg\versions\YM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YM_version.txt" (
  set "YM_version=�� 信�젺�˙��" )

set "EA_version_qst=�� 信�젺�˙��"		  
  if exist "%APPDATA%\txtcfg\versions\EA_version.txt" (
  set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1 )
  
  if exist "%APPDATA%\txtcfg\versions\EA_md_version.txt" (
  set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_md_version.txt >nul 2>&1 )
		  
set /p UM_version=< %APPDATA%\txtcfg\versions\UM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\UM_version.txt" (
  set "UM_version=�� 信�젺�˙��" )

set /p YT_versionA=< %APPDATA%\txtcfg\txtcfga\YT_version.txt >nul 2>&1
set /p YM_versionA=< %APPDATA%\txtcfg\txtcfga\YM_version.txt >nul 2>&1
set /p EA_version_origA=< %APPDATA%\txtcfg\txtcfga\EA_version.txt >nul 2>&1
set /p EA_version_modA=< %APPDATA%\txtcfg\txtcfga\EA_md_version.txt >nul 2>&1
set /p UM_versionA=< %APPDATA%\txtcfg\txtcfga\UM_version.txt >nul 2>&1

:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
cls
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 1004                롡쳽ㄺ� 循ª％昔�-��誓Д��音               �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
echo [1] 췅━ⓥ� ㄻ� �昔ㄾウ��⑨...
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
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �   뤲�´夕� 췅エ葉� Þ收惜β 貰ⅳÞ��⑨...                        �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
timeout /t 1 /nobreak >nul

ping -n 1 google.com >nul
if errorlevel 1 (

echo � Google ...  ! ERROR CONNECTION !                                 ! �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
set /a connect_error=2
timeout /t 1 /nobreak >nul

) else (
echo � Google ...  OK                                                   V �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

)

ping -n 1 ya.ru >nul
if errorlevel 1 (

echo � Yandex ...  ! ERROR CONNECTION !                                 ! �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
set /a connect_error=2
timeout /t 1 /nobreak >nul

) else (
echo � Yandex ...  OK                                                   V �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

)

ping -n 1 github.com >nul
if errorlevel 1 (

echo � Github ...  ! ERROR CONNECTION !                                 ! �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

set /a connect_error=1
timeout /t 1 /nobreak >nul

) else (
echo � Github ...  OK                                                   V �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

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

echo � !  롡率恂手濕� ㄾ飡承 � github...                                ! �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠

echo �™���Л硫 誓┬� 젶殊˘昔쥯�
echo -----------------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
timeout /t 3 /nobreak >nul
cls
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 1005                롡쳽ㄺ� 循ª％昔�-��誓Д��音               �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
echo [1] 췅━ⓥ� ㄻ� �昔ㄾウ��⑨...
choice /c 1 /n
 if errorlevel 1 goto cnt1005
)

:cnt1005
timeout /t 3 /nobreak >nul

goto russianscript


:success_net2
 
echo � ?  끷筍 �昔∥�И�, �� github ㄾ飡承��                            ? �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
echo ----------------------------------------------------------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
timeout /t 2 /nobreak >nul
cls
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 1006                롡쳽ㄺ� 循ª％昔�-��誓Д��音               �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
echo [1] 췅━ⓥ� ㄻ� �昔ㄾウ��⑨...
choice /c 1 /n
 if errorlevel 1 goto cnt1006
)
:cnt1006
timeout /t 2 /nobreak >nul

goto russianscript


:success_net

echo �   댂收惜β 貰ⅳÞ���� � ��涉ㄺ�                                   �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
echo ----------------------------------------------------------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
timeout /t 2 /nobreak >nul
cls
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 1007                롡쳽ㄺ� 循ª％昔�-��誓Д��音               �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
echo [1] 췅━ⓥ� ㄻ� �昔ㄾウ��⑨...
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
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �   뤲�´夕� 췅エ葉� ��¡� ´褻Ŀ %name_YT%...             �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
timeout /t 1 /nobreak >nul

:: del "%/SF%%name_YT%.old" >nul 2>&1

if "%offline_mode%"=="1" (

echo � !           렊��˙���� �ⅱ�㎚�┃�. Github �ⅳ�飡承��.            ! �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
echo ----------------------------------------------------------------------
echo  뮙ゃ�좑 ´褻⑨: %YT_version%
timeout /t 1 /nobreak >nul
goto check_offline_mode
) else (

if "%replaced_mode%"=="1" (

:: Compare the current script with the updated version == REPLACED_MODE ==
fc "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
 if errorlevel 1 (
 
    echo � 렊��˙���� 췅ħ���! 뇿｀習첓 ��¡� ´褻Ŀ %name_YT% ...      �
    echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
	
powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/RF%\%name_YT_Replace_exe%.new' }"

    
	:: 6060
    move /y "%/RF%%name_YT_Replace_exe%.new" "%/RF%%name_YT_Replace_exe%" >nul

	del "%/versions%\%name_txtcfg_YT_version%" >nul 2>&1
	move /y "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
	
	
    echo �            뤲�｀젹쵟 信�θ�� �∼�˙�췅!                          �
    echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
    echo ----------------------------------------------------------------------
    echo  뮙ゃ�좑 ´褻⑨: %YT_version%
	echo =====================================
	echo [궘º젺��! 궕ヮ曄� 誓┬� 쭬Д耀�⑨]
	echo =====================================
	echo [~]  룯誓쭬�信�.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (
	
    echo �            � 쥯� 拾� �젹좑 ��쥯� ´褻⑨                          �
    echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
    echo ----------------------------------------------------------------------
    echo  뮙ゃ�좑 ´褻⑨: %YT_version%
    timeout /t 1 /nobreak >nul
    goto check_offline_mode
)

)

:: Compare the current script with the updated version 
fc "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
 if errorlevel 1 (
 
    echo � 렊��˙���� 췅ħ���! 뇿｀習첓 ��¡� ´褻Ŀ %name_YT% ...      �
    echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
	
powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/SF%%name_dwn_YT%' }"

    move /y "%/SF%%name_dwn_YT%" "%/SF%%name_YT%" >nul

	del "%/versions%\%name_txtcfg_YT_version%" >nul 2>&1
	move /y "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
	
	
    echo �            뤲�｀젹쵟 信�θ�� �∼�˙�췅!                          �
    echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
    echo ----------------------------------------------------------------------
    echo  뮙ゃ�좑 ´褻⑨: %YT_version%
	echo [~]  룯誓쭬�信�.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (
	
    echo �            � 쥯� 拾� �젹좑 ��쥯� ´褻⑨                          �
    echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
    echo ----------------------------------------------------------------------
    echo  뮙ゃ�좑 ´褻⑨: %YT_version%
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
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo �                     YimTools exe edition                          �
echo �                                                                   �
echo �                   궏褻⑨ 稅黍���: %YT_version%                         �
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo  궏褻⑨ 췅 �젵收: %YT_versionA%

if "%develop_mode%"=="1" (
echo dwnActVersionsStatus:=%dwnActVersionsStatus%= )
echo ---------------------------------------------------------------------
echo   앪� �昔｀젹쵟 承昔飡ⓥ �昔璵遜 稅좂Ð젺⑨ 聲ⅵⓨ ´褻Ł YimMenu,
echo   稅黍�獸� � ��с � ¡㎚�┃� ㅰ膝ⓨ �黍汀�音 �ヮ蜈�. 
echo                   ~ 룼レ㎯⒱α� � 蝨�¡レ飡˘�� ~
@echo.
echo                               Мㄾㄵ�-ヮ〃收レ 뜥ぎ쳽� (FluffyFox337)
echo ---------------------------------------------------------------------
echo ========== 겓젫�쩆涉 將º ヮㅿ� щ ª�젰� � 蝨�¡レ飡˘�� ===========
@echo.
echo       Yimura, L7Neg, Loled69, Alestarov, Gir489returns, TheKuter, 
echo     USBMenus, Ezeholz, Razethion, Deadlineem, Xesdoog, Silent-Night,
echo                     RazorGamerX, FluffyFox337
echo    ------------ � ㅰ膝�� 瑟젲젰щ� �젳�젩�洵Ø�! --------------------

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
echo 			꺂젪��� Д��
echo ---------------------------------------------------------------------
if "%replaced_mode%"=="1" (
echo ---------------------------------------------------------------------
echo  �もÐⓣ�쥯� 誓┬� 쭬Д耀�⑨ 
echo ---------------------------------------------------------------------
)
if "%ymne%"=="1" (
echo ---------------------------------------------------------------------
echo  룧�첓 YimMenu �� �∼졷拾�췅, 쭬�信殊收 葉� � ��誓쭬�信殊收 YimTools.  
@echo.
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo �             뫁⑴졹 信�젺�˚� 젮ㄾ��� �ⅱ�㎚�┃�!               �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
@echo.
start %/YimMenu%
echo ---------------------------------------------------------------------
)

echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo �                         꺂젪��� Д��                            �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 1 뫇좂졻�-信�젺�˘筍 (葉�,Þ┘も��,젮ㄾ��)                      1 �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 2 꽡��キⓥ�レ�瑜 �ヮ沃� (믞젺召�設,º��設 췅飡昔ⅹ � ㅰ...)     2 �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 3 뜝飡昔ø�                                                     3 �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo [8] 댂飡說ゆ⑨ �� 쭬�信ゃ 葉��.
echo [9] 귣⒱� �� �昔｀젹щ.
echo ---------------------------------------------------------------------
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 끷エ 캙�첓 쭬｀習�� 췅若ㄸ恂� �� � �拾��� Д飡� Œ� ρ �β�,   �
echo �  獸＄� �� 僧�ョ젺⑧ 쭬｀習え ▲ㅳ� 췅 �젩�曄� 飡�ゥ.           �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

choice /c 12389 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 3 goto menu_settings
 if errorlevel 2 goto optional_downloads_RU
 if errorlevel 1 goto menu_downloads



:menu_offline_RU
cls
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo �  //OFFLINE//          YimTools exe edition           //OFFLINE//  �
echo �                                                                   �
echo �                   궏褻⑨ 稅黍���: %YT_version%                         �
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo ---------------------------------------------------------------------
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � !                          굧닃�뜄�                             ! �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo �  뜢栒 ㄾ飡承� � Github. 궕ヮ曄� �™���Л硫 誓┬�.                 �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�

echo ---------------------------------------------------------------------
echo   앪� �昔｀젹쵟 承昔飡ⓥ �昔璵遜 稅좂Ð젺⑨ 聲ⅵⓨ ´褻Ł YimMenu,
echo   稅黍�獸� � ��с � ¡㎚�┃� ㅰ膝ⓨ �黍汀�音 �ヮ蜈�. 
echo                   ~ 룼レ㎯⒱α� � 蝨�¡レ飡˘�� ~
@echo.
echo                               Мㄾㄵ�-ヮ〃收レ 뜥ぎ쳽� (FluffyFox337)
echo ---------------------------------------------------------------------
echo ========== 겓젫�쩆涉 將º ヮㅿ� щ ª�젰� � 蝨�¡レ飡˘�� ===========
@echo.
echo       Yimura, L7Neg, Loled69, Alestarov, Gir489returns, TheKuter, 
echo     USBMenus, Ezeholz, Razethion, Deadlineem, Xesdoog, Silent-Night,
echo                     RazorGamerX, FluffyFox337
echo    ------------ � ㅰ膝�� 瑟젲젰щ� �젳�젩�洵Ø�! --------------------

REM echo ========================= CREDITS ===================================
REM echo       Yimura, L7Neg, Loled69, Alestarov, Gir489returns, TheKuter, 
REM echo     USBMenus, Ezeholz, Razethion, Deadlineem, Xesdoog, Silent-Night,
REM echo                     RazorGamerX, FluffyFox337
REM echo    ------------ and more respectfull developers! --------------------



timeout /t 2 /nobreak >nul
@echo.

echo ---------------------------------------------------------------------
echo 			꺂젪��� Д��  (�™���Л硫 誓┬�)
echo ---------------------------------------------------------------------
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � ?           귣‥黍 譽� 若曄夭 誠�쳽筍                           ? �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 1 ��몤릮뎷�                                                     1 �
echo �===================================================================�
echo � ! � 쥯� �β Þ收惜β 貰ⅳÞ��⑨, ��將�с 栒� 쵟ギ �勝も��...    ! �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo [8] 댂飡說ゆ⑨ �� 쭬�信ゃ 葉��.
echo [9] 귣⒱� �� �昔｀젹щ.
echo ---------------------------------------------------------------------
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 끷エ 캙�첓 쭬｀習�� 췅若ㄸ恂� �� � �拾��� Д飡� Œ� ρ �β�,   �
echo �  獸＄� �� 僧�ョ젺⑧ 쭬｀習え ▲ㅳ� 췅 �젩�曄� 飡�ゥ.           �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

choice /c 189 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 1 goto menu_settings


:menu_downloads
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � ?           귣‥黍 譽� 若曄夭 誠�쳽筍                           ? �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � 1 뫇좂졻� �昔｀젹с-Þ┘も��                                    1 �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 2 뫇좂졻� 葉� Д�� YimMenu                                      2 �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 3 볚�젺�˘筍 ㄾ��キ��⑨-稅黍�瞬 ㄻ� YimMenu                     3 �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo [8] 댂飡說ゆ⑨ �� 쭬�信ゃ 葉��.
echo [9] 궏惜呻藺� � ＋젪��� Д��.
echo ---------------------------------------------------------------------
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 끷エ 캙�첓 쭬｀習�� 췅若ㄸ恂� �� � �拾��� Д飡� Œ� ρ �β�,   �
echo �  獸＄� �� 僧�ョ젺⑧ 쭬｀習え ▲ㅳ� 췅 �젩�曄� 飡�ゥ.           �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

choice /c 12389 /n
 if errorlevel 9 goto check_offline_mode
 if errorlevel 8 goto instructions_RU
 if errorlevel 3 goto choice_addons_RU
 if errorlevel 2 goto download_yimmenu_RU
 if errorlevel 1 goto choice_injectors_RU

:menu_settings
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � �                          ��몤릮뎷�                            � �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � 1 롧ⓤ殊筍 캙�ゃ ぅ�� YimMenu (〓飡贍� 十め ��笹� �∼��� GTA V) 1 �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 2 뮔∥ⓩ� 젶栒젷彛�飡� ´褻Ł (�昔´閃 �� 信�졷�エ エ 葉瞬)     2 �
echo 쳐袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴羔�
echo � 3 롡む淫� 캙�ゃ /YimTools. 룧�첓 � ぎ�十ｃ�졿⑨Ж.              3 �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 4 롡む淫� 캙�ゃ /Scripts. 룧�첓 � 젮ㄾ췅Ж.                     4 �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 5 롡む淫� 캙�え /xml_vehicles-maps. 룧�첓 � XML ぎ�收�獸�.      5 �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 6 롡む淫� 캙�ゃ /json_vehicles. 룧�첓 � JSON 循젺召�設��.       6 �
echo 쳐袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴羔�
echo � 7 � 몼昔� 췅飡昔ⅹ � 蝨젷���� ㏇ε �젵ギ� YM � YM.            � 7 �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo ---------------------------------------------------------------------
echo [8] 댂飡說ゆ⑨ �� 쭬�信ゃ 葉��.
echo [9] 궏惜呻藺� � ＋젪��� Д��.
echo ---------------------------------------------------------------------
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo � 끷エ 캙�첓 쭬｀習�� 췅若ㄸ恂� �� � �拾��� Д飡� Œ� ρ �β�,   �
echo �  獸＄� �� 僧�ョ젺⑧ 쭬｀習え ▲ㅳ� 췅 �젩�曄� 飡�ゥ.           �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

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
echo 	  뒥� 信�젺�˘筍/ⓤ��レ㎜쥯筍 葉� Д�� YimMenu
echo ------------------------------------------------------------------
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � 1                   뇿�信殊收 GTA 5                  1 �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캘
echo � 꽡┐ⓥα� ��キ�� 쭬｀習え � 灑┘狩硫 誓┬� Œ� ��쳽þ. �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠

timeout /t 3 /nobreak >nul
@echo.
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � 2            뇿�信殊收 �昔｀젹с Þ┘も��            2 �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캘
echo �  � �濡�黍收 �젵� YimMenu.dll ㄻ� Þ┘も� � ª說        �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠

timeout /t 2 /nobreak >nul
@echo.
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � 3     귣‥黍收 拾� 쭬�申���硫 �昔璵遜 (gta5.exe)     3 �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캘
echo �  ��笹� 曄． �誘�キⓥ� Þ┘も 葉�� 췅쬊� き��ゃ INJECT  �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠

timeout /t 2 /nobreak >nul
@echo.
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � 4        룼笹� Þ┘も� 쭬ħⓥ� � GTA V.              4 �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠

timeout /t 2 /nobreak >nul
@echo.
echo    ______                                    ______
echo   /_____/ 끷エ ㏇� �昔獄� 信�θ��, � ª誓   /_____/
echo  /_____/ ㄾウ�� �獸□젳ⓥ藺� �き� YimMenu. /_____/

timeout /t 2 /nobreak >nul
@echo.
echo -------------------------------------------------------------------
echo -------------------------------------------------------------------
echo  =  꽞� �洙贍殊�/쭬む淫⑨ 葉�-Д�� 췅━ⓥ� か젪②� INSERT.
echo  =  쀢�〓 �∼�˘筍 ぅ� 쭬ħⓥ� � 췅飡昔ø� 葉�-Д�� � 췅━ⓥ� き��ゃ 럞뜋굠뮏 뒇�/Update Cache.
echo  =  꽞� 稅贍殊� �き� 葉�� � ゥ¡� ´齧��� 膝ャ 
echo      �昔ħⓥ� � 췅飡昔ø�: Settings - GUI � 嵩�黍收 짛ギ囹� � �勝も� Show Overlay 
@echo.
@echo.
echo ===================================================================
echo [1] 뜝━ⓥ� 1 ㄻ� �音�쩆 � ＋젪��� Д�� ...

timeout /t 1 /nobreak >nul

choice /c 1 /n
 if errorlevel 1 goto check_offline_mode
 
 

:choice_injectors_RU

cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �         뫇좂졻� �昔｀젹с-Þ┘も��                   �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
echo � 1  Xenos                                             1 �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
echo � 2  Fate_Injector                                     2 �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
echo [3]  귣⒱� � ＋젪��� Д��.

choice /c 123 /n
 if errorlevel 3 goto check_offline_mode
 if errorlevel 2 goto download_fate_injector_RU
 if errorlevel 1 goto download_xenos_RU

:check_yimmenu_E_RU

cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � ?        댾��レ㎜쥯エ-エ �� YimMenu �젺ⅴ? (Y/N)     ? �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠

set /p yn= 뜝━ⓥ� Y � 笹晨젰 ��ギ┬收レ��． �手β�: 
if /i "%yn%"=="Y" (
goto download_extras_addon_RU
) else (
    cls
    echo "룼쬊ャ⒰�� 說좂젷� 쭬｀習ⓥ� � 쭬�信殊收 YimMenu ��誓� 쭬｀習ぎ� Extras Addon."
    echo "룼笹� 쭬�信첓 YimMenu, �� М┘收 ´惜呻藺� � 將�� �勝も � 쭬｀習ⓥ� Extras Addon."
    echo "꽞� 쭬�信첓 YimMenu 쥯� ���▼�ㄸМ 쭬｀習ⓥ� �昔｀젹с-Þ┘も�� FateInjector, Xenos � Þ瑜."
	echo ------------------------------------------------------------------
	echo "룯誓� 쭬�信ぎ� YimMenu 쭬｀習ⓥα� � 灑┘狩硫 誓┬� Œ� ��쳽þ."
	echo "끷エ �� �� ㎛젰收, 첓� ⓤ��レ㎜쥯筍 YimMenu, 췅━ⓥ� 6 � ＋젪��� Д��, 譽�〓 ��ャ葉筍 Þ飡說ゆĿ."
	echo ------------------------------------------------------------------
	echo "귣若� � ＋젪��� Д�� (15醒�)."
    timeout /t 15 /nobreak >nul
    cls
    goto check_offline_mode
	)
	
:check_yimmenu_U_RU

cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � ?        댾��レ㎜쥯エ-エ �� YimMenu �젺ⅴ? (Y/N)     ? �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠

set /p yn= 뜝━ⓥ� Y � 笹晨젰 ��ギ┬收レ��． �手β�: 
if /i "%yn%"=="Y" (
 goto download_ultimate_menu_RU
 ) else (
	cls
    echo "룼쬊ャ⒰�� 說좂젷� 쭬｀習ⓥ� � 쭬�信殊收 YimMenu ��誓� 쭬｀習ぎ� Extras Addon."
    echo "룼笹� 쭬�信첓 YimMenu, �� М┘收 ´惜呻藺� � 將�� �勝も � 쭬｀習ⓥ� Extras Addon."
    echo "꽞� 쭬�信첓 YimMenu 쥯� ���▼�ㄸМ 쭬｀習ⓥ� �昔｀젹с-Þ┘も�� FateInjector, Xenos � Þ瑜."
	echo ------------------------------------------------------------------
	echo "룯誓� 쭬�信ぎ� YimMenu 쭬｀習ⓥα� � 灑┘狩硫 誓┬� Œ� ��쳽þ."
	echo "끷エ �� �� ㎛젰收, 첓� ⓤ��レ㎜쥯筍 YimMenu, 췅━ⓥ� 6 � ＋젪��� Д��, 譽�〓 ��ャ葉筍 Þ飡說ゆĿ."
	echo ------------------------------------------------------------------
	echo "귣若� � ＋젪��� Д�� (15醒�)."
	timeout /t 15 /nobreak >nul
	cls
	goto check_offline_mode
    )

:delete_cache_folder_RU

cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � !                         굧닃�뜄�                              ! �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo �    뱾젷���� ぅ�� YimMenu ���▼�ㄸМ 뭿떆뒑 αエ �� �∼�˘エ       �
echo �     YimMenu.dll, �� 聖�� ㏇� ι� �昔ⓤ若ㅿ�.                      �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
timeout /t 2 /nobreak >nul
echo � 귣��キ畑恂� �洵ⓤ洙� ぅ��...                                      �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
timeout /t 2 /nobreak >nul
rmdir /s /q "%/YimMenu%\cache"
echo � 뒫� 〓� 信�θ�� �葉耀�.                                           �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
timeout /t 1 /nobreak >nul
echo �  귣若� � ＋젪��� Д�� .                                           �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo ---------------------------------------------------------------------
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 끷エ 將� �� 誓鼇� �昔∥�с, �昔´閃收 飡�젺ⓩ� �昔∥�� 췅 GitHub  �
echo �  �� 젮誓率 https://github.com/YimMenu/YimMenu/issues .            �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

timeout /t 3 /nobreak >nul
cls

echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � !                         굧닃�뜄�                              ! �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo �    뱾젷���� ぅ�� YimMenu ���▼�ㄸМ 뭿떆뒑 αエ �� �∼�˘エ       �
echo �     YimMenu.dll, �� 聖�� ㏇� ι� �昔ⓤ若ㅿ�.                      �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � 귣��キ畑恂� �洵ⓤ洙� ぅ��...                                      �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 뒫� 〓� 信�θ�� �葉耀�.                                           �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo �  귣若� � ＋젪��� Д�� ..                                         �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo ---------------------------------------------------------------------
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 끷エ 將� �� 誓鼇� �昔∥�с, �昔´閃收 飡�젺ⓩ� �昔∥�� 췅 GitHub  �
echo �  �� 젮誓率 https://github.com/YimMenu/YimMenu/issues .            �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

timeout /t 6 /nobreak >nul
cls

echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � !                         굧닃�뜄�                              ! �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo �    뱾젷���� ぅ�� YimMenu ���▼�ㄸМ 뭿떆뒑 αエ �� �∼�˘エ       �
echo �     YimMenu.dll, �� 聖�� ㏇� ι� �昔ⓤ若ㅿ�.                      �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � 귣��キ畑恂� �洵ⓤ洙� ぅ��...                                      �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 뒫� 〓� 信�θ�� �葉耀�.                                           �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo �  귣若� � ＋젪��� Д�� ...                                        �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo ---------------------------------------------------------------------
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 끷エ 將� �� 誓鼇� �昔∥�с, �昔´閃收 飡�젺ⓩ� �昔∥�� 췅 GitHub  �
echo �  �� 젮誓率 https://github.com/YimMenu/YimMenu/issues .            �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

timeout /t 1 /nobreak >nul
goto check_offline_mode

:download_extras_addon_RU
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �        볚�젺�˚�  Extras Addon �� 誓��㎤獸黍�        �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
timeout /t 1 /nobreak >nul
echo � 뱾젷���� 飡졷音 OLD ‥첓���...                       � �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_E-a%.old" >nul 2>&1
del "%/Scripts%\%name_E-j%.old" >nul 2>&1
del "%/Scripts%\%name_E-d%.old" >nul 2>&1

timeout /t 1 /nobreak >nul


if exist "%/Scripts%\%name_E-a%" (

  echo � 렊췅說┘� Extras-Addon.lua. 뫌ℓ젺�� ��¡． ‥첓캙...  �
  echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_E-a%" "%name_E-a%.old"
  rename "%/Scripts%\%name_E-j%" "%name_E-j%.old"
  rename "%/Scripts%\%name_E-d%" "%name_E-d%.old"
  
  echo � 겈첓� 貰ℓ젺. 볚�젺�˚� Extras-Addon...                �
  echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
  
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_orig_Url%' -OutFile '%/Scripts%\%name_E-a%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Json_orig_Url%' -OutFile '%/Scripts%\%name_E-j%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Data_orig_Url%' -OutFile '%/Scripts%\%name_E-d%' }"
  
) else (
	  
    echo � Extras-Addon.lua �� �∼졷拾��. 뿨飡좑 信�젺�˚�...     �
    echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	  
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
	echo � ! ERROR: 뜢 蝨젷�刷 稅좂졻� �젵� json.lua            ! �
    echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	timeout /t 2 /nobreak >nul
	              
	echo � ! 궙遜�젺�˙���� ‥첓캙...                           ! �
    echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_E-a%" >nul 2>&1
	del "%/Scripts%\%name_E-j%" >nul 2>&1
    del "%/Scripts%\%name_E-d%" >nul 2>&1
	
    rename "%/Scripts%\%name_E-a%.old" %name_E-a%
    rename "%/Scripts%\%name_E-j%.old" %name_E-j%
    rename "%/Scripts%\%name_E-d%.old" %name_E-d%
    timeout /t 1 /nobreak >nul
    @echo.
    echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
    echo � !                     굧닃�뜄�                       ! �
    echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캘
    echo �  겈첓� ¡遜�젺�˙��. 뇿｀習첓 ���音 �젵ギ� 뛿 뱞���몴  �
    echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
	@echo.
    echo ----------------------------------------------------------
    echo 뤲�´閃收 췅エ葉� Þ收惜β 貰ⅳÞ��⑨ Œ� 젶栒젷彛�飡� 
    echo  遜維え 췅 �젵� � ぎㄵ.
    echo ----------------------------------------------------------
    echo [1]  귣⒱� � ＋젪��� Д��.
	choice /c 1 /n
    if errorlevel 1 goto check_offline_mode 
	    )
				  
) else (

  echo � ! ERROR: 뜢 蝨젷�刷 稅좂졻� �젵� Extras-Addon.lua    ! �
  echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
  timeout /t 2 /nobreak >nul
  
  echo � ! 궙遜�젺�˙���� ‥첓캙...                           ! �
  echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
  echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
  echo � !                     굧닃�뜄�                       ! �
  echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캘
  echo �  겈첓� ¡遜�젺�˙��. 뇿｀習첓 ���音 �젵ギ� 뛿 뱞���몴  �
  echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
  @echo.
  echo ----------------------------------------------------------
  echo 뤲�´閃收 췅エ葉� Þ收惜β 貰ⅳÞ��⑨ Œ� 젶栒젷彛�飡� 
  echo  遜維え 췅 �젵� � ぎㄵ.
  echo ----------------------------------------------------------
  echo [1]  귣⒱� � ＋젪��� Д��.
  choice /c 1 /n
  if errorlevel 1 goto check_offline_mode
       )
		
:continue_dwn_extras_addon
					   
if exist "%/Scripts%\%name_E-d%" (
  goto download_extras_addon_RU_Success 
  
  ) else (
	echo � ! ERROR: 뜢 蝨젷�刷 稅좂졻� �젵� Extras-data.lua     ! �
    echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	timeout /t 1 /nobreak >nul
						
	echo � ! 궙遜�젺�˙���� %name_E-d%...               ! �
    echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
	@echo.
	rename "%/Scripts%\%name_E-d%.old" %name_E-d%
    timeout /t 2 /nobreak >nul
	goto download_extras_addon_RU_Success_Data_Notice )
				  	  
:download_extras_addon_RU_Success
	             
echo � Extras-addon.lua 信�θ�� 쭬｀拾��.                    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
				 
timeout /t 1 /nobreak >nul
echo � Json.lua 信�θ�� 쭬｀拾��.                            �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	             
timeout /t 1 /nobreak >nul
echo � Extras-data.lua 信�θ�� 쭬｀拾��.                     �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	             
timeout /t 1 /nobreak >nul

echo �  뱾젷���� ‥첓캙...                                    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_E-a%.old" >nul 2>&1
del "%/Scripts%\%name_E-j%.old" >nul 2>&1
del "%/Scripts%\%name_E-d%.old" >nul 2>&1
				 
				 
echo � 뫇黍�� Extras-addon 信�θ�� 信�젺�˙��.               �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
@echo.
del "%/versions%\%name_txtcfg_EA_md_version%" >nul 2>&1
del "%/versions%\%name_txtcfg_EA_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_version%" "%/versions%\%name_txtcfg_EA_version%" >nul
timeout /t 1 /nobreak >nul

set /p Extras-Addon_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1

echo ----------------------------------------------------------
echo  궏褻⑨ extras-addon : %Extras-Addon_version_qst%
echo ----------------------------------------------------------
echo "깶� �젵�?   믡�: %/Scripts%\%name_E-a%"
echo "깶� �젵�?   믡�: %/Scripts%\%name_E-j%"
echo "깶� �젵�?   믡�: %/Scripts%\%name_E-d%"
echo ----------------------------------------------------------
echo [1]  귣⒱� � ＋젪��� Д��.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode

				               

:download_extras_addon_RU_Success_Data_Notice
	             
echo � Extras-addon.lua 信�θ�� 쭬｀拾��.                    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
@echo.
@echo.
				 
timeout /t 1 /nobreak >nul
echo � Json.lua 信�θ�� 쭬｀拾��.                            �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
@echo.
@echo.
	             
timeout /t 1 /nobreak >nul
echo � Extras-data.lua ¡遜�젺�˙��. 뇿｀習첓 �� 蝨젷졹�   ! �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
@echo.
@echo.
	             
echo ==================================================
timeout /t 1 /nobreak >nul
@echo.
@echo.
echo � 뱾젷���� ‥첓캙...                                     �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_E-a%.old" >nul 2>&1
del "%/Scripts%\%name_E-j%.old" >nul 2>&1
del "%/Scripts%\%name_E-d%.old" >nul 2>&1
				 
				 
echo �! 뫇黍�� Extras-addon 뱫땸굧� 信�θ�� 信�젺�˙��.     ! �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
@echo.
del "%/versions%\%name_txtcfg_EA_md_version%" >nul 2>&1
del "%/versions%\%name_txtcfg_EA_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_version%" "%/versions%\%name_txtcfg_EA_version%" >nul
timeout /t 1 /nobreak >nul
set /p Extras-Addon_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1
echo ----------------------------------------------------------
echo  궏褻⑨ extras-addon : %Extras-Addon_version_qst%
echo ----------------------------------------------------------
echo "깶� �젵�?   믡�: %/Scripts%\%name_E-a%"
echo "깶� �젵�?   믡�: %/Scripts%\%name_E-j%"
echo "깶� �젵�?   믡�: %/Scripts%\%name_E-d%"
echo ----------------------------------------------------------
echo [1]  귣⒱� � ＋젪��� Д��.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode 
					 

:download_extras_addon_custom_RU
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �        볚�젺�˚� 첓飡�Л�． Extras Addon             �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
timeout /t 1 /nobreak >nul
echo � 뱾젷���� �黍（췅レ��． Extras Addon...               � �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_E-a%" >nul 2>&1

echo � 뇿｀習첓 첓飡�Л�． Extras-Addon...                    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_item_mod_Url%' -OutFile '%/Scripts%\%name_E-a%' }"

if exist "%/Scripts%\%name_E-a%" (

echo � 뒥飡�Л硫 Extras-addon 信�θ�� 信�젺�˙��.            �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
@echo.

del "%/versions%\%name_txtcfg_EA_version%" >nul 2>&1
del "%/versions%\%name_txtcfg_EA_md_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_md_version%" "%/versions%\%name_txtcfg_EA_md_version%" >nul
set /p Extras-Addon_version_qst=< %APPDATA%\txtcfg\versions\EA_md_version.txt >nul 2>&1

timeout /t 1 /nobreak >nul

echo ----------------------------------------------------------
echo  궏褻⑨ 첓飡�Л�． extras-addon : %Extras-Addon_version_qst%
echo  궏褻⑨ �黍（췅レ� extras-addon : %Extras-Addon_version_origA%
echo ----------------------------------------------------------
echo "깶� �젵�?   믡�: %/Scripts%\%name_E-a%"
echo ----------------------------------------------------------
echo [1]  귣⒱� � ＋젪��� Д��.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode
) else (

    echo � ! ERROR: 뜢 蝨젷�刷 稅좂졻� �젵� Extras-addon.lua    ! �
    echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
	timeout /t 1 /nobreak >nul
	echo ----------------------------------------------------------
    echo [1]  귣⒱� � ＋젪��� Д��.
    choice /c 1 /n
    if errorlevel 1 goto check_offline_mode
			)		 
			
			
:download_ultimate_menu_RU
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �        볚�젺�˚� UltimateMenu �� 誓��㎤獸黍�         �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
timeout /t 1 /nobreak >nul
echo � 뱾젷���� 飡졷音 OLD ‥첓���...                       � �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UM%.old" >nul 2>&1


if exist "%/Scripts%\%name_UM%" (

  echo � 렊췅說┘� UltimateMenu.lua. 뫌ℓ젺�� ��¡． ‥첓캙...  �
  echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_UM%" "%name_UM%.old"

  echo � 겈첓� 貰ℓ젺. 뇿｀習첓 UltimateMenu...                 �
  echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
  
  powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UM%' } "
  
) else (

echo � UltimateMenu.lua �� �∼졷拾��. 뿨飡좑 信�젺�˚�...    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	  
del "%/Scripts%\%name_UM%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UM%' } "

timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_UM%" (

timeout /t 1 /nobreak >nul
echo � UltimateMenu.lua 信�θ�� 쭬｀拾��.                    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	             
timeout /t 1 /nobreak >nul
echo �  뱾젷���� ‥첓캙...                                    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UM%.old" >nul 2>&1
				 
				 
echo � 뫇黍�� UltimateMenu 信�θ�� 信�젺�˙��.               �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
@echo.
del "%/versions%\%name_txtcfg_UM_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_UM_version%" "%/versions%\%name_txtcfg_UM_version%" >nul
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo  궏褻⑨ YimMenu : %Ultimate_Menu_version%
echo ----------------------------------------------------------
echo "깶� �젵�?  믡�: %/Scripts%\%name_UM%"
echo ----------------------------------------------------------
echo [1]  귣⒱� � ＋젪��� Д��.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode

	) else (
	
	echo � ! ERROR: 뜢 蝨젷�刷 稅좂졻� �젵� UltimateMenu.lua    ! �
    echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

    timeout /t 2 /nobreak >nul	
	echo � ! 궙遜�젺�˙���� ‥첓캙...                           ! �
    echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_UM%" >nul 2>&1
    rename "%/Scripts%\%name_UM%.old" %name_UM%

    @echo.
    echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
    echo � !                     굧닃�뜄�                       ! �
    echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캘
    echo �  겈첓� ¡遜�젺�˙��. 뇿｀習첓 ���音 �젵ギ� 뛿 뱞���몴  �
    echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
	@echo.
    echo ----------------------------------------------------------
    echo 뤲�´閃收 췅エ葉� Þ收惜β 貰ⅳÞ��⑨ Œ� 젶栒젷彛�飡� 
    echo  遜維え 췅 �젵� � ぎㄵ.
    echo ----------------------------------------------------------
    echo [1]  귣⒱� � ＋젪��� Д��.
	choice /c 1 /n
    if errorlevel 1 goto check_offline_mode 
	    )

	
:download_yimmenu_RU
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �       뇿｀習첓 ��¡� ´褻Ŀ YimMenu �� 誓��㎤獸黍�   �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
timeout /t 1 /nobreak >nul
echo � 뱾젷���� 飡졷音 OLD ‥첓���...                       � �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YM%.old" >nul 2>&1

if exist "%/Downloads%\%name_YM%" (

  echo � 렊췅說┘� %name_YM%. 뫌ℓ젺�� ��¡． ‥첓캙...  �
  echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
  timeout /t 2 /nobreak >nul
  rename "%/Downloads%\%name_YM%" "%name_YM%.old"

  echo � 겈첓� 貰ℓ젺. 뇿｀習첓 YimMenu...                      �
  echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

  powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YM%' }"
	
) else (

echo � YimMenu.dll �� �∼졷拾��.      뿨飡좑 信�젺�˚�...    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	  
del "%/Downloads%\%name_YM%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YM%' }"

timeout /t 3 /nobreak >nul )

if exist "%/Downloads%\%name_YM%" (

timeout /t 1 /nobreak >nul
echo � YimMenu.dll 信�θ�� 쭬｀拾��.                         �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	             
timeout /t 1 /nobreak >nul
echo �  뱾젷���� ‥첓캙...                                    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YM%.old" >nul 2>&1
				 
				 
echo � 뿨�-Д��  YimMenu 信�θ�� 信�젺�˙��.                 �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
@echo.
del "%/versions%\%name_txtcfg_YM_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_YM_version%" "%/versions%\%name_txtcfg_YM_version%" >nul
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo  궏褻⑨ YimMenu : %YM_version%
echo ----------------------------------------------------------
echo "깶� �젵�?  믡�: %/Downloads%\%name_YM%"
echo ----------------------------------------------------------
echo [1]  귣⒱� � ＋젪��� Д��.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode

) else (

    echo � ! ERROR: 뜢 蝨젷�刷 稅좂졻� �젵� YimMenu.dll         ! �
    echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

    timeout /t 2 /nobreak >nul	
	echo � ! 궙遜�젺�˙���� ‥첓캙...                           ! �
    echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
    timeout /t 1 /nobreak >nul
    del "%/Downloads%\%name_YM%" >nul 2>&1
    rename "%/Downloads%\%name_YM%.old" %name_YM%

    @echo.
    echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
    echo � !                     굧닃�뜄�                       ! �
    echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캘
    echo �  겈첓� ¡遜�젺�˙��. 뇿｀習첓 ���音 �젵ギ� 뛿 뱞���몴  �
    echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
	@echo.
    echo ----------------------------------------------------------
    echo 뤲�´閃收 췅エ葉� Þ收惜β 貰ⅳÞ��⑨ Œ� 젶栒젷彛�飡� 
    echo  遜維え 췅 �젵� � ぎㄵ.
    echo ----------------------------------------------------------
    echo [1]  귣⒱� � ＋젪��� Д��.
	choice /c 1 /n
    if errorlevel 1 goto check_offline_mode 
	    )


:download_fate_injector_RU
cls
echo ------------------------------------------------------------------
echo 	뫇좂졻� Þ┘も�� FateInjector �� 誓��㎤獸黍� 
echo ------------------------------------------------------------------
echo "뤲�´夕� 췅エ葉� FateInjector.exe � 캙�ぅ 뇿｀習え Œ� 췅 �젩�曄� 飡�ゥ ..."
timeout /t 1 /nobreak >nul
cls

if exist "%/Downloads%\%name_FateInjector%" (
 echo "뜝ħ�� FateInjector, 궇� �� �拾�� 稅좂Ð졻� ⅲ� 說�쥯."
 timeout /t 1 /nobreak >nul
 goto quest_start_Fateinjector_RU
 ) else (
   echo "뇿｀習첓 FateInjector ..."
   powershell -command "& { Invoke-WebRequest -Uri '%FateInjector_orig_Url%' -OutFile '%/Downloads%\%name_FateInjector%' }"
   if not exist "%/Downloads%\%name_FateInjector%" (
    echo "Error: 뜢 蝨젷�刷 稅좂졻� �젵� %name_FateInjector%. 뤲�´閃收 췅エ葉� Þ收惜β 貰ⅳÞ��⑨ Œ� 젶栒젷彛�飡� 遜維え 췅 �젵� ."
    ) else (
      cls
      echo "FateInjector 信�θ�� 쭬｀拾��. "
	  echo "깶� �젵�?   믡�: %/Downloads%\%name_FateInjector%"
	  timeout /t 3 /nobreak >nul )
	  )
	  
:quest_start_Fateinjector_RU
cls		  
set /p yn=빇殊收 쭬�信殊筍 �昔｀젹с-Þ┘も�� FateInjector.exe? (Y/N): 
if /i "%yn%"=="y" (
goto start_FateInjector_RU
) else (
cls
echo "귣若� � ＋젪��� Д��..."
timeout /t 1 /nobreak >nul
cls
goto check_offline_mode 

:download_xenos_RU
cls
echo ------------------------------------------------------------------
echo 	뫇좂졻� Þ┘も�� Xenos64 �� 誓��㎤獸黍� 
echo ------------------------------------------------------------------
echo " 뤲�´夕� 췅エ葉� Xenos64.exe � 캙�ぅ 뇿｀習え Œ� 췅 �젩�曄� 飡�ゥ ..."
timeout /t 1 /nobreak >nul
cls

if exist "%/Downloads%\%name_Xenos%" (
echo " 뜝ħ�� Xenos64, 궇� �� �拾�� 稅좂Ð졻� ⅲ� 說�쥯."
timeout /t 2 /nobreak >nul
goto quest_start_Xenos_RU
) else (
  echo "뇿｀習첓 Xenos64 ..."
  powershell -command "& { Invoke-WebRequest -Uri '%Xenos64_item_Url%' -OutFile '%/Downloads%\%name_Xenos%' }"
  if not exist "%/Downloads%\%name_Xenos%" (
  echo "Error: 뜢 蝨젷�刷 稅좂졻� �젵� %name_Xenos%. 뤲�´閃收 췅エ葉� Þ收惜β 貰ⅳÞ��⑨ Œ� 젶栒젷彛�飡� 遜維え 췅 �젵� � ぎㄵ."
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
set /p yn=빇殊收 쭬�信殊筍 �昔｀젹с-Þ┘も�� %name_Xenos%? (Y/N): 
if /i "%yn%"=="y" (
goto start_Xenos_RU
) else (
cls
echo "귣若� � ＋젪��� Д��..."
timeout /t 1 /nobreak >nul
cls
goto check_offline_mode )


:choice_addons_RU
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �  귣‥黍收 稅黍��-젮ㄾ� ㄻ� 信�젺�˚�. (to /scripts)  �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
echo � [1]  Extras-Addon                                    1 �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
echo � [2]  Ultimate-Menu                                   2 �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
echo [3]  귣⒱� � ＋젪��� Д��.
echo ----------------------------------------------------------
echo [4] � 롡む淫� 캙�ゃ /scripts. 뮔� 稅黍�瞬-ㄾ��キ��⑨.

choice /c 1234 /n
 if errorlevel 4 goto open_scripts_folder_RU
 if errorlevel 3 goto check_offline_mode
 if errorlevel 2 goto check_yimmenu_U_RU
 if errorlevel 1 goto check_yimmenu_E_RU


:optional_downloads_RU
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �         맆㎙①�瑜 �ヮ沃�                             �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
echo � 1  Get XML Maps/Vehicles (Opens in Browser)          1 �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
echo � 2  Download Animations Dictionary (Yim root folder)  2 �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
echo � 3  볚�젺�˘筍 첓飡�Л硫 Extras-addon                 3 �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
echo � 4  벏�젪ゥ��� 췅飡昔ø젹� YimMenu (settings.json)    4 �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
echo [5]  귣⒱� � ＋젪��� Д��.
echo ----------------------------------------------------------
echo [6] � 롡む淫� 캙�ゃ /YimMenu. 뒶惜ⅱ좑 캙�첓 葉�-Д��.
echo [7] � 롡む淫� 캙�ゃ /YimTools. 룧�첓 � ぎ�十ｃ�졿⑨Ж.
@echo.
echo [8] � 뫇좂졻� YimTools � %RF%/%name_YT_Replace_exe%
echo [9] � 뫇좂졻� Xenos64 � %RF%/%name_YT_Replace_exe%

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
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo �         맆㎙①�瑜 �ヮ沃� (Offline)                        �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo � 1 � 롡む淫� 캙�ゃ /YimTools. 룧�첓 � ぎ�十ｃ�졿⑨Ж.      � �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 2 � 롡む淫� 캙�ゃ /YimMenu. 뒶惜ⅱ좑 캙�첓 葉�-Д��.      � �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 3 � 롡む淫� 캙�ゃ /Scripts. 룧�첓 � 젮ㄾ췅Ж.             � �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 4 � 롡む淫� 캙�ゃ /xml_vehicles. 룧�첓 � XML 循젺召�設��. � �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo [5]  귣⒱� � ＋젪��� Д��.
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
  set "YT_version=�� 信�젺�˙��" )
		  
set /p YM_version=< %APPDATA%\txtcfg\versions\YM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YM_version.txt" (
  set "YM_version=�� 信�젺�˙��" )
		  
set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\EA_version.txt" (
  set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_md_version.txt >nul 2>&1 )
		   
  if not exist "%APPDATA%\txtcfg\versions\EA_md_version.txt" (
  set "EA_version_qst=�� 信�젺�˙��" )
		  
set /p UM_version=< %APPDATA%\txtcfg\versions\UM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\UM_version.txt" (
  set "UM_version=�� 信�젺�˙��" )

set /p YT_versionA=< %APPDATA%\txtcfg\txtcfga\YT_version.txt >nul 2>&1
set /p YM_versionA=< %APPDATA%\txtcfg\txtcfga\YM_version.txt >nul 2>&1
set /p EA_version_origA=< %APPDATA%\txtcfg\txtcfga\EA_version.txt >nul 2>&1
set /p EA_version_modA=< %APPDATA%\txtcfg\txtcfga\EA_md_version.txt >nul 2>&1
set /p UM_versionA=< %APPDATA%\txtcfg\txtcfga\UM_version.txt >nul 2>&1

:: ----------------------------------------------------------------------------------------------------------------------------------------
	
cls
echo =====================================================================
echo ----           뮙ゃ蟯� 信�젺�˙���瑜 ´褻Ŀ                      ----
echo ----           � 젶栒젷彛瑜 ´褻Ŀ 췅 �젵收:                     ----
echo ---------------------------------------------------------------------
timeout /t 1 /nobreak >nul
@echo.
@echo.
echo =====================================================================
echo  볚�젺�˙��췅� ´褻⑨ YimTools : %YT_version%
echo ---------------------------------------------------------------------
echo  �も�젷彛좑 ´褻⑨ YimTools : %YT_versionA%
echo =====================================================================
@echo.
echo =====================================================================
echo  볚�젺�˙��췅� ´褻⑨ YimMenu : %YM_version%
echo ---------------------------------------------------------------------
echo  �も�젷彛좑 ´褻⑨ YimMenu : %YM_versionA%
echo =====================================================================
@echo.
echo =====================================================================
echo  볚�젺�˙��췅� ´褻⑨ Extras-Addon : %EA_version_qst%
echo ---------------------------------------------------------------------
echo  �も�젷彛좑 ´褻⑨ Extras-Addon : %EA_version_origA%
echo =====================================================================
@echo.
echo =====================================================================
@echo.
echo =====================================================================
echo  볚�젺�˙��췅� ´褻⑨ UltimateMenu : %UM_version%
echo ---------------------------------------------------------------------
echo  �も�젷彛좑 ´褻⑨ UltimateMenu : %UM_versionA%
echo =====================================================================

echo [1]  귣⒱� � ＋젪��� Д��.

choice /c 1 /n
 if errorlevel 1 goto check_offline_mode




:download_XML_Maps_RU
cls
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 롡む淫�� 遜維え MagicModz89's MEGA � □졼㎘誓...                  �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
timeout /t 1 /nobreak >nul
start "XML Maps" "%XML_maps_Url%"

:: cscript //nologo BringToFront.vbs
:xml_info
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 쀢�〓 ⓤ��レ㎜쥯筍 ⓨ, 쭬｀習ⓥ� �젵� � 兒席졻� zip               �
echo �  � �㎖ゥえ收 貰�手β飡㏂迹ⅴ 貰ㄵ逝º�� �� �呻�:                  �
echo �-------------------------------------------------------------------�
echo �  %/YimMenu%\xml_maps and xml_vehicles � 
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo ---------------------------------------------------------------------
echo [1]  귣⒱� � Д�� ㄾ� �ヮ蜈�.
echo [2] � 롡む淫� 캙�ゃ /xml_maps and xml_vehicles.
choice /c 12 /n
 if errorlevel 2 goto open_xml_folder_RU
 if errorlevel 1 goto optional_downloads_RU
 

:download_animDictsCompact_RU
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �    뇿｀習첓 줎㏓ 쩆��音 젺º졿Ł �� 誓��㎤獸黍�      �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
timeout /t 1 /nobreak >nul
echo � 뱾젷���� 飡졷音 OLD ‥첓���...                       � �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_aDC%.old" >nul 2>&1

if exist "%/YimMenu%\%name_aDC%" (

  echo � 렊췅說┘� animDictsCompact. 뫌ℓ젺�� ��¡． ‥첓캙...  �
  echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
  timeout /t 2 /nobreak >nul
  rename "%/YimMenu%\%name_aDC%" "%name_aDC%.old"

  echo � 겈첓� 貰ℓ젺. 뇿｀習첓 animDictsCompact...             �
  echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
  
powershell -command "& { Invoke-WebRequest -Uri '%aDC_orig_Url%' -OutFile '%/YimMenu%/%name_aDC%' }"

) else (

echo � animDictsCompact �� �∼졷拾��.   뿨飡좑 信�젺�˚�...  �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	  
del "%/YimMenu%\%name_aDC%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%aDC_orig_Url%' -OutFile '%/YimMenu%/%name_aDC%' }"

timeout /t 3 /nobreak >nul )

if exist "%/YimMenu%\%name_aDC%" (

timeout /t 1 /nobreak >nul
echo � animDictsCompact 信�θ�� 쭬｀拾��.                    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
	             
timeout /t 1 /nobreak >nul
echo �  뱾젷���� ‥첓캙...                                    �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_aDC%.old" >nul 2>&1
				 
				 
echo � 걽쭬 쩆��音 젺º졿Ł 信�θ�� 信�젺�˙�췅.             �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "깶� �젵�?  믡�: %/YimMenu%/%name_aDC%"
echo ----------------------------------------------------------
echo  귣若� � Д�� ㄾ� �ヮ蜈� 曄誓� 5 醒�...
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_RU

) else (

    echo � ! ERROR: 뜢 蝨젷�刷 稅좂졻� animDictsCompact         ! �
    echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑

    timeout /t 2 /nobreak >nul	
	echo � ! 궙遜�젺�˙���� ‥첓캙...                           ! �
    echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
    timeout /t 1 /nobreak >nul
    del "%/YimMenu%\%name_aDC%" >nul 2>&1
    rename "%/YimMenu%\%name_aDC%.old" %name_aDC%

    @echo.
    echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
    echo � !                     굧닃�뜄�                       ! �
    echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캘
    echo �  겈첓� ¡遜�젺�˙��. 뇿｀習첓 ���音 �젵ギ� 뛿 뱞���몴  �
    echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴暠
	@echo.
    echo ----------------------------------------------------------
    echo 뤲�´閃收 췅エ葉� Þ收惜β 貰ⅳÞ��⑨ Œ� 젶栒젷彛�飡� 
    echo  遜維え 췅 �젵� � ぎㄵ.
    echo ----------------------------------------------------------
    echo [1]  귣⒱� � Д�� ㄾ� �ヮ蜈�
	choice /c 1 /n
    if errorlevel 1 goto check_offline_mode 
	)


:choice_settings_RU

cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo �    벏�젪ゥ��� 췅飡昔ø젹� YimMenu (Settings.json)    �
echo 勁袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴攷
echo � [1] 볚�젺�˘筍 첓飡�Л瑜 췅飡昔ø� �� 젪獸�� YimTools  �
echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
echo � [2] 궙遜�젺�˘筍 聲�� �젺ⅴ 率耀飡¡쥯�鼇� 췅飡昔ø�   �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
echo [3]  귣⒱� � Д�� ㄾ� �ヮ蜈�.

choice /c 123 /n
 if errorlevel 3 goto optional_downloads_RU
 if errorlevel 2 goto restore_settings_RU
 if errorlevel 1 goto import_settings_RU


:import_settings_RU
cls
echo ------------------------------------------------------------------
echo 	뒥飡�Л瑜 췅飡昔ø� settings.json ㄻ� 葉� Д�� YimMenu 
echo ------------------------------------------------------------------
echo " 뤲�´夕� 췅エ葉� 拾� 率耀飡㏂迹ⅲ� �젵쳽 췅飡昔ⅹ... "

if exist "%/YimMenu%/%name_YM-settings%" (

echo "겈첓� 拾� 率耀飡㏂迹ⓨ 췅飡昔ⅹ settings.json ..."
timeout /t 2 /nobreak >nul
rename "%/YimMenu%\%name_YM-settings%" "%name_YM-settings%.old"
timeout /t 1 /nobreak >nul
goto dwn_settings_noexist
) else (
:dwn_settings_noexist
echo "볚�젺�˚� 첓飡�Л�． settings.json �� 젪獸�� YimTools..."
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YM-settings%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%settings_item_Url%' -OutFile '%/YimMenu%/%name_YM-settings%' }"

if not exist "%/YimMenu%/%name_YM-settings%" (
		echo "Error: 뜢 蝨젷�刷 稅좂졻� �젵� %name_YM-settings%. 뤲�´閃收 췅エ葉� Þ收惜β 貰ⅳÞ��⑨ Œ� 젶栒젷彛�飡� 遜維え 췅 �젵� � ぎㄵ."
	) else (
	    cls
		echo "뒥飡�Л瑜 췅飡昔ø� 信�θ�� 信�젺�˙���. "
		echo "깶� �젵�? 믡�: %/YimMenu%/%name_YM-settings%"
		echo "Returning to the main menu in 5 seconds." )
timeout /t 5 /nobreak >nul
cls
goto check_offline_mode )

:restore_settings_RU
cls
echo ------------------------------------------------------------------
echo 	궙飡젺�˙���� 췅飡昔ⅹ settings.json ㄻ� 葉� Д�� YimMenu 
echo ------------------------------------------------------------------
echo " 뤲�´夕� 췅エ葉� ‥첓캙 �젵쳽 settigs.json... "
timeout /t 2 /nobreak >nul
if exist "%/YimMenu%/%name_YM-settings%.old" (
echo " 귣��キ畑恂� ¡遜�젺�˙���� �젵쳽 settigs.json... "
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YM-settings%" >nul 2>&1
rename "%/YimMenu%\%name_YM-settings%.old" %name_YM-settings%
if exist "%/YimMenu%/%name_YM-settings%" (
echo " 궙遜�젺�˙���� �젵쳽 %name_YM-settings% �昔獄� 뱫룆삆� "
) else (
echo " 궙遜�젺�˙���� �젵쳽 %name_YM-settings% 뛿 뱞�땸몴 " )
timeout /t 2 /nobreak >nul
goto check_offline_mode
) else (
cls
echo " 곹첓� �젵쳽 %name_YM-settings% 뛿 ��뎱뀓 "
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
echo "뇿�信� ��¡� ´褻Ŀ YimTools ..."
timeout /t 2 /nobreak >nul
start %name_YT%
exit

:start_Xenos_RU

cls
echo 뇿�信� �昔｀젹щ-Þ┘も��� Xenos ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\%name_Xenos%
:: start Xenos64.exe
exit

:start_instructions_Xenos
cls
echo 쭬�信� 收め獸¡� Þ飡說ゆĿ Þ┘も� YimMenu
start "" %/Downloads%\%name_Xenos-instructions%
exit

:start_FateInjector_RU

cls
echo 뇿�信� �昔｀젹щ-Þ┘も��� FateInjector ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\%name_FateInjector%
:: FateInjector.exe
exit

:put_YimTools_R
cls
if "%/RF%"=="�� 췅㎛좂��" (
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � !                     굧닃�뜄�                          ! �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � �呻� 쭬Д�� �� 췅㎛좂��. 뤲�´閃收 txt ぎ�十ｃ�졿⑧       �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo ----------------------------------------------------------------------------
echo 뵠œ 栒�:  %/paths%\path_replace.txt
echo ----------------------------------------------------------------------------
@echo.
echo ============================================================================
echo [1] 뜝━ⓥ� 1 ㄻ� �音�쩆 � ＋젪��� Д�� ...
echo [2] 뜝━ⓥ� 2 ㄻ� �洙贍殊� �젵쳽 ぎ�十ｃ�졿Ŀ ...

choice /c 12 /n
 if errorlevel 2 start %/paths%\path_replace.txt
 if errorlevel 1 goto check_offline_mode
 
)

if "%name_YT_Replace_exe%"=="�� 췅㎛좂��" (
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � !                     굧닃�뜄�                          ! �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 닾� 쭬Д�� �� 췅㎛좂���. 뤲�´閃收 txt ぎ�十ｃ�졿⑧       �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo ----------------------------------------------------------------------------
echo 뵠œ 栒�:  %/paths%\name_replace.txt
echo ----------------------------------------------------------------------------
@echo.
echo ============================================================================
echo [1] 뜝━ⓥ� 1 ㄻ� �音�쩆 � ＋젪��� Д�� ...
echo [2] 뜝━ⓥ� 2 ㄻ� �洙贍殊� �젵쳽 ぎ�十ｃ�졿Ŀ ...

choice /c 12 /n
 if errorlevel 2 start %/paths%\name_replace.txt exit
 if errorlevel 1 goto check_offline_mode
)


echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � !                     굧닃�뜄�                          ! �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � YimTools 쭬Д�ⓥ 貰‘� 丞젳젺�莘 � ぎ�十ｃ�졿Ŀ �昔｀젹с �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo ----------------------------------------------------------------------------
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � 귣 瑟�誓�� 譽� 若殊收 쭬Д�ⓥ� %name_YT_Replace_exe% 稅黍�獸�?         �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo ----------------------------------------------------------------------------
echo 뵠œ ▲ㄵ� 栒�:  %/RF%\%name_YT_Replace_exe%
echo ----------------------------------------------------------------------------

set /p yn=뜝━ⓥ� Y � 笹晨젰 ��ギ┬收レ��． �手β�:
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/RF%\%name_YT_Replace_exe%' }"

timeout /t 1 /nobreak >nul
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo �    볚�θ�� 쭬｀拾���        �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
timeout /t 1 /nobreak >nul
exit
) else (

cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo �         귣若�...            �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
timeout /t 1 /nobreak >nul
exit
)

:put_Xenos_R
cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � !                     굧닃�뜄�                          ! �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � Xenos ▲ㄵ� 稅좂젺 � 캙�ゃ �昔｀젹щ %name_YT_Replace_exe% �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo ----------------------------------------------------------------------------
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � 귣 瑟�誓�� 譽� 若殊收 쭬Д�ⓥ� %name_YT_Replace_exe% 稅黍�獸�?         �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
echo ----------------------------------------------------------------------------
echo "뵠œ ▲ㄵ� 栒�:  %/RF%\%name_YT_Replace_exe%"
echo ----------------------------------------------------------------------------

set /p yn=뜝━ⓥ� Y � 笹晨젰 ��ギ┬收レ��． �手β�:
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%Xenos64_item_Url%' -OutFile '%/RF%\%name_YT_Replace_exe%' }"

timeout /t 1 /nobreak >nul
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo �    볚�θ�� 쭬｀拾���        �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
timeout /t 1 /nobreak >nul
exit

) else (

cls
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo �         귣若�...            �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
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
echo 믡� ��첓 譽� �①ⅲ� �β�, ¡㎚�┃� � ▲ㅳ耀�
echo ��琠ⓥ碎 첓첓�-�Æ蝨� ��쥯� 押�ゆ⑨...
timeout /t 2 /nobreak >nul
goto check_offline_mode

:reset
cls
rmdir /s /q %/YimMenu%
rmdir /s /q %/cfg%
timeout /t 1 /nobreak >nul
echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo �   몼昔� 췅飡昔ⅹ �誘�キ��   �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
timeout /t 1 /nobreak >nul
echo ===============================
goto goodbye_RU

:goodbye_RU
cls
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � ~        뫍졹Æ� 쭬 ⓤ��レ㎜쥯��� YimTools,       ~ �
echo � ~                뤲⑨狩�� ª贍!                   ~ �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
timeout /t 2 /nobreak >nul
exit

:exit_RU
echo 귣若� ...
exit /b

:blocked
cls

echo �袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴敲
echo � !                     굧닃�뜄�                          ! �
echo 픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � 뫁⑴졹 ��レ㎜쥯筍碎 葉� Д�� �ⅰⅶ�캙說�.                 �
echo � 뤲�｀젹쵟 쭬∥�え昔쥯췅 ㄾ ��琠ゥ��� ‥㎜캙說�� �∼���.   �
echo 훤袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴�
@echo.
echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo � ~        뫍졹Æ� 쭬 ⓤ��レ㎜쥯��� YimTools,       ~ �
echo � ~                뤲⑨狩�� ª贍!                   ~ �
echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
timeout /t 5 /nobreak >nul
exit

:auto_mode_RU
cls
goto check_offline_mode
:: ------------- YimMenu -------------------------------



:: ------------- Xenos64 -------------------------------


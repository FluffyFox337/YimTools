@ECHO OFF

:: ========================================================================================================================================
:: ===================================== Script's Heading =================================================================================
:: ========================================================================================================================================

   :: ===== File info =====
   :: encoding UTF-8 
   :: syntaxis Batch CMD BAT
   :: last edit:26.05.24 / 17:37 msk
   :: =====================


:: ========================================================================================================================================
:: ===================================== Script's Settings ================================================================================
:: ========================================================================================================================================


:: ------------------ TRIGGERS ------------------------------------
set /a "blocked_mode=0"

:: ------------------ PATHS_SETS --------------------------------
set "/SF=%~dp0"

:: ------------------ NAMES_SETS ----------------------------------
set "name_YT=YimTools_alfa.exe"
set "name_YT_bat=YimTools_alfa(exe)_RU.bat"

:: -------------- DEFAULT_PATHS_SETS ------------------------
set "/Downloads=%USERPROFILE%\Downloads"

:: .....................................
if not exist "%/Downloads%" (
   set "/Downloads=%USERPROFILE%\OneDrive\Desktop" )
if not exist "%/Downloads%" (
   set "/Downloads=%USERPROFILE%\Desktop" )


:: ------------------ Update YimTools --------------------------------
set "updateScript_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"

:: set "updateScript_bat_Url=https://github.com/FluffyFox337/YimTools/raw/main/YimTools%20project_exe/Source/for%20release/YimTools_alfa(exe)_RU.bat"
set "updateScript_bat_Url=https://goo.su/wultdz"
:: -------------------------------------------------------------------

cls 
echo                     Choice what download                     
echo ---------------------------------------------------------------------
echo 1 YimTools_alfa.exe
echo: 
echo 2 YimTools_alfa(exe)_RU.bat 
echo: 
echo 3 Exit                                             
echo ---------------------------------------------------------------------
choice /c 123 /n
 if errorlevel 3 exit
 if errorlevel 2 goto dwnbat
 if errorlevel 1 goto dwnexe

:: ===============================================================================================================

:dwnexe
cls
echo ======================================================================
echo =   Downloading full EXE file...                                     =
echo ======================================================================
timeout /t 1 /nobreak >nul
powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/SF%%name_YT%' }"

echo =                        Downloaded!                                 =
echo ======================================================================
echo ----------------------------------------------------------------------
echo start full file...

timeout /t 1 /nobreak >nul

start %name_YT%
exit

:dwnbat
cls
echo ======================================================================
echo =   Downloading full BAT file...                                     =
echo ======================================================================
timeout /t 1 /nobreak >nul
powershell -command "& { Invoke-WebRequest -Uri '%updateScript_bat_Url%' -OutFile '%/SF%%name_YT_bat%' }"

echo =            Downloaded!                                             =
echo ======================================================================
echo ----------------------------------------------------------------------
echo start full file...

timeout /t 1 /nobreak >nul

start %name_YT_bat%
exit

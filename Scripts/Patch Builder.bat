@echo off
setlocal enabledelayedexpansion

:: Directory where the script is stored
set "base_directory=C:\Games\ChromieCraft_3.3.5a\Custom Tools"
echo script is running here %base_directory%

:: file list and temp files for storage
set "temp_file=%base_directory%\temp.txt"
:: This needs the appdata directory mapped to Z drive
set "file_list=Z:\binhex-nginx\nginx\MPQ\mandatory\mandatory_file_list.txt"

:: Runs a headless export from the spell editor, pulling all the DBC files from the MYSQL database, this includes edits made by other devs.
:: Any DBC edits made outside of the spell editor tool should be saved in the spell editor export folder.
cd /d "%base_directory%\WoW Spell Editor"
call HeadlessExport.exe

:: Clean and pull the latest version of the repo.
::cd /d "%base_directory%\Zeppelin-Core"
::git pull

:: Copies the DBC files from the spell editor export folder to the server.
:: This needs the directory mapped to the drive
xcopy /s /y "%base_directory%\WoW Spell Editor\Export" "R:\env\dist\bin\dbc"

:: Run the MPQ editor to update the local MPQ file (PATCH-Z.MPQ) with the DBC files from the spell editor export folder.
cd /d "%base_directory%\MPQ Editor"
call MPQEditor.exe /console "%base_directory%\Zeppelin-Core\Scripts\MPQ Scripts\MPQZ-DBC.txt"

:: Run the MPQ editor to update the local MPQ file (PATCH-Z.MPQ) with the Creature files.
cd /d "%base_directory%\MPQ Editor"
call MPQEditor.exe /console "%base_directory%\Zeppelin-Core\Scripts\MPQ Scripts\MPQZ-Creatures.txt"

:: Copy the updated MPQ file (PATCH-Z.MPQ) to the NGINX Patch folder
xcopy /s /y "%base_directory%\Zeppelin-Core\MPQ Patches\PATCH-Z.MPQ" "Z:\binhex-nginx\nginx\MPQ\mandatory"

:: Upload the new PATCH-Z.MPQ file to Github 
::cd /d "%base_directory%\Zeppelin-Core"
::git add -A
::git commit -am "Automatic update of PATCH-Z.MPQ"
::git push

for /f "usebackq tokens=1,* delims=:" %%a in ("!file_list!") do (
    set "server_file=%%a"
    set "server_version=%%b"
    if "!server_file!"=="PATCH-Z.MPQ" (
       set /a server_version+=1
    )
)

:: Copy the version file to temp file except the PATCH-Z.MPQ line
findstr /V "PATCH-Z.MPQ" "!file_list!" > "%temp_file%"
echo PATCH-Z.MPQ:!server_version!>>"%temp_file%"
copy /y "%temp_file%" "%file_list%"
del "%temp_file%"

pause

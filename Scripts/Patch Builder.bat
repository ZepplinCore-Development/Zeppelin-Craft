:: Runs a headless export from the spell editor, pulling all the DBC files from the MYSQL database, this includes edits made by other devs.
:: Any DBC edits made outside of the spell editor tool should be saved in the spell editor export folder.
cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\WoW Spell Editor
call HeadlessExport.exe

:: Clean and pull the latest version of the repo.
cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core
git reset --hard HEAD
git clean -f -d
git pull

:: Copies the DBC files from the spell editor export folder to the server.
xcopy /s /y "C:\Games\ChromieCraft_3.3.5a\Custom Tools\WoW Spell Editor\Export" "Y:\env\dist\bin\dbc"

:: Run the MPQ editor to update the local MPQ file (patch-5.MPQ) with the DBC files from the spell editor export folder.
cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\MPQ Editor
call MPQEditor.exe /console "C:\Games\ChromieCraft_3.3.5a\Custom Tools\MPQ Editor\BUILD-MPQ5.txt"

:: Copy the updated MPQ file (patch-5.MPQ) to the client Data folder
xcopy /s /y "C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core\MPQ Patches\patch-5.MPQ" "C:\Games\ChromieCraft_3.3.5a\Data"

:: Upload the new patch-5.MPQ file to Github 
cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core
git add -a
git commit -am "Automatic update of patch-5.MPQ"
git push
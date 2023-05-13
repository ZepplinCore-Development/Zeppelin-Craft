:: Runs a headless export from the spell editor, pulling all the DBC files from the MYSQL database, this includes edits made by other devs.
:: Any DBC edits made outside of the spell editor tool should be saved in the spell editor export folder.
cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\WoW Spell Editor
call HeadlessExport.exe

:: Clean and pull the latest version of the repo.
cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core
git pull

:: Copies the DBC files from the spell editor export folder to the server.
xcopy /s /y "C:\Games\ChromieCraft_3.3.5a\Custom Tools\WoW Spell Editor\Export" "Y:\env\dist\bin\dbc"

:: Run the MPQ editor to update the local MPQ file (patch-z.MPQ) with the DBC files from the spell editor export folder.
cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\MPQ Editor
call MPQEditor.exe /console "C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core\Scripts\MPQ Scripts\MPQZ-DBC.txt"

:: Run the MPQ editor to update the local MPQ file (patch-z.MPQ) with the Creature files.
cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\MPQ Editor
call MPQEditor.exe /console "C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core\Scripts\MPQ Scripts\MPQZ-Creature.txt"

:: Copy the updated MPQ file (patch-z.MPQ) to the client Data folder
xcopy /s /y "C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core\MPQ Patches\patch-z.MPQ" "C:\Games\ChromieCraft_3.3.5a\Data"

:: Upload the new patch-z.MPQ file to Github 
cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core
git add -a
git commit -am "Automatic update of patch-z.MPQ"
git push
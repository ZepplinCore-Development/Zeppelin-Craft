:: Updates the client to the latest version of Zeppelin Core
:: Place in the same directory as the wow.exe file
:: Use this to launch the game

:: Saves the current directory as a variable
SET var=%cd%
ECHO %var%

:: checks if the repository exists, clones if it does not, pulls if it does.
if exist "%var%\Custom Tools" (ECHO "Custom Tools Exists") else (mkdir "Custom Tools")
if exist "%var%\Custom Tools\Zeppelin-Core" (
cd "%var%\Custom Tools\Zeppelin-Core" git pull
) else (cd "%var%\Custom Tools" && git clone https://github.com/justurn/Zeppelin-Core)

cmd /k

:: Replace the wow.exe with Zeppelin Cores

:: Copy Patch-5.MPQ to the Data folder

:: OLD STUFF

:: Clean and pull the latest version of the repo.
::cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core
::git pull

:: Copies the DBC files from the spell editor export folder to the server.
::xcopy /s /y "C:\Games\ChromieCraft_3.3.5a\Custom Tools\WoW Spell Editor\Export" "Y:\env\dist\bin\dbc"

:: Run the MPQ editor to update the local MPQ file (patch-5.MPQ) with the DBC files from the spell editor export folder.
::cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\MPQ Editor
::call MPQEditor.exe /console "C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core\Scripts\BUILD-MPQ5.txt"

:: Copy the updated MPQ file (patch-5.MPQ) to the client Data folder
::xcopy /s /y "C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core\MPQ Patches\patch-5.MPQ" "C:\Games\ChromieCraft_3.3.5a\Data"

:: Upload the new patch-5.MPQ file to Github 
::cd C:\Games\ChromieCraft_3.3.5a\Custom Tools\Zeppelin-Core
::git add -a
::git commit -am "Automatic update of patch-5.MPQ"
::git push
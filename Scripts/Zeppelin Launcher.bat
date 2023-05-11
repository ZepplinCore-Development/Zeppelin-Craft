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

:: Copy the exe file downloaded from Zeppelin-Core Github to the client folder.
xcopy /s /y "%var%\Custom Tools\Zeppelin-Core\EXE Patch\Wow.exe" "%var%"

:: Copy the MPQ file downloaded from Zeppelin-Core Github to the client data folder.
xcopy /s /y "%var%\Custom Tools\Zeppelin-Core\MPQ Patches\patch-5.MPQ" "%var%\Data"

:: Runs Wow.exe
start Wow.exe

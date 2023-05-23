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
xcopy /s /y "%var%\Custom Tools\Zeppelin-Core\MPQ Patches\patch-z.MPQ" "%var%\Data"

:: Download the creature MPQ
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Wp2_1IBnrD_ffTJ1gztK3_prW87gRdUo' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1Wp2_1IBnrD_ffTJ1gztK3_prW87gRdUo" -O PATCH-F.MPQ && rm -rf /tmp/cookies.txt

:: Runs Wow.exe
start Wow.exe

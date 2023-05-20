::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFCt7fjCtD1eeA6YX/Ofr0+KGr0AYRqw2e4C7
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCt7fjCtD1eeA6YX/Ofr09CCsl0YWOsxOKPaz7qNKOUBpED8cPY=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
:: Updates the client to the latest version of Zeppelin Core
:: Place in the same directory as the wow.exe file
:: Use this to launch the game

:: Saves the current directory as a variable
SET var=%cd%
ECHO %var%

:: checks if the repository exists, clones if it does not, pulls if it does.
if exist "%var%\Custom Tools" (ECHO "Custom Tools Exists") else (mkdir "Custom Tools")
if exist "%var%\Custom Tools\Zeppelin-Core" (
cd "%var%\Custom Tools\Zeppelin-Core" && git pull
) else (cd "%var%\Custom Tools" && git clone https://github.com/justurn/Zeppelin-Core)

:: Copy the exe file downloaded from Zeppelin-Core Github to the client folder.
xcopy /s /y "%var%\Custom Tools\Zeppelin-Core\EXE Patch\Wow.exe" "%var%"

:: Copy the MPQ file downloaded from Zeppelin-Core Github to the client data folder.
xcopy /s /y "%var%\Custom Tools\Zeppelin-Core\MPQ Patches\patch-z.MPQ" "%var%\Data"

:: Runs Wow.exe
cd %var%
start Wow.exe

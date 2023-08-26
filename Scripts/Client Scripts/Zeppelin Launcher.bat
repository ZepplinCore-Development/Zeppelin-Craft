::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDFBXxCXLmWGIrAP4/z0/9adp10NUe42ds+TiP3AKeMcig==
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
::Zh4grVQjdCyDJGyX8VAjFDFBXxCXLmWGIrAP4/z0/9a9p10NUe42ds/326GAI+gW+AvhbZNN
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion

:: Server base URL
set "server_base_url=http://61.245.129.209:8111/"

:: Define URLs for the file lists
set "mandatory_file_list_url=%server_base_url%mandatory/mandatory_file_list.txt"
set "optional_file_list_url=%server_base_url%optional/optional_file_list.txt"

:: Directory where local files are stored
set "local_directory=%~dp0"

:: Version and temp files for storage
set "temp_file=%local_directory%Data\client_versions_temp.txt"
set "temp_temp_file=%local_directory%Data\client_versions_temp_temp.txt"
set "versions_file=%local_directory%Data\client_versions.txt"

:: Delete existing temp file if it exists
if exist "!temp_file!" (
    del "!temp_file!"
)

:: Check if client_versions.txt exists, initialise history
set "client_version_history="
if exist "%local_directory%Data\client_versions.txt" (
    set "client_version_history=true" 

    echo Client version history exists here: "!versions_file!"
    for /f "usebackq tokens=1,* delims=:" %%c in ("!versions_file!") do (
        set "Client_file_name=%%c"
        set "client_file_version=%%d"
        :: Update temp file with the new version
        echo !Client_file_name!:!client_file_version!>>"!temp_file!"
    )
) else (
    :: No client_versions.txt
    echo No Client Version History
)

:: Fetch the list of mandatory files from the server and store it in the Data directory as server_mandatory_file_list.txt
set "mandatory_list=%local_directory%Data\server_mandatory_file_list.txt"
curl -# -o "!mandatory_list!" "%mandatory_file_list_url%"
echo Checking Mandatory File List

:: Read the mandatory list and store file names and version numbers
for /f "usebackq tokens=1,* delims=:" %%a in ("!mandatory_list!") do (
    set "server_file_name=%%a"
    set "server_file_version=%%b"
    echo Server File - !server_file_name! : Server Version - !server_file_version!
    
    :: Initialize variables
    set "client_file_version=0"
    set "client_file_exists="
    set "versions_updated="
    
    :: Process each line in temp file
    if "!client_version_history!"=="true" (
        for /f "usebackq tokens=1,* delims=:" %%c in ("!temp_file!") do (
            set "client_file_name=%%c"
            if "!client_file_name!"=="!server_file_name!" (
                set "client_file_exists=true"
                set "client_file_version=%%d"
                echo Client File - !server_file_name! : Client Version - !client_file_version!
                if not "!client_file_version!"=="!server_file_version!" (
                    echo Client File - !server_file_name!, Client version "!client_file_version!" does not match server version "!server_file_version!"
                    :: Download the mandatory file
                    curl -# -o "%local_directory%Data!server_file_name!" "%server_base_url%mandatory/!server_file_name!"
                    :: Remove the old version from the temp file
                    findstr /V "!client_file_name!:!client_file_version!" "!temp_file!" > "!temp_temp_file!"
                    copy /y "!temp_temp_file!" "!temp_file!"
                    del "!temp_temp_file!"
                    :: Add the new version to the temp file
                    echo !server_file_name!:!server_file_version!>>"!temp_file!"
                    set "versions_updated=true"
                )
            )
        )
    ) 

    :: If the file was missing from the client version list download it
    if not defined client_file_exists (
        echo No Client Version History For This File
        :: Download the mandatory file
        curl -# -o "%local_directory%Data!server_file_name!" "%server_base_url%mandatory/!server_file_name!"
        :: Update temp file with the new version
        echo !server_file_name!:!server_file_version!>>"!temp_file!"
        set "versions_updated=true"
    )

    :: Replace client_versions.txt with the updated content
    if "!versions_updated!"=="true" (
        echo Updating client version history
        copy /y "!temp_file!" "!versions_file!"   
    )
)

:: Launch the game
echo Launching Zeppelin Craft
start "" "%local_directory%Wow.exe"

:: Fetch the list of optional files from the server and store it in the Data directory as server_optional_file_list.txt
set "optional_list=%local_directory%Data\server_optional_file_list.txt"
curl -# -o "!optional_list!" "%optional_file_list_url%"
echo Checking Optional File List

:: Read the optional list and store file names and version numbers
for /f "usebackq tokens=1,* delims=:" %%a in ("!optional_list!") do (
    set "server_file_name=%%a"
    set "server_file_version=%%b"
    echo Server File - !server_file_name! : Server Version - !server_file_version!
    
    :: Initialize variables
    set "client_file_version=0"
    set "client_file_exists="
    set "versions_updated="
    
    :: Process each line in temp file
    if "!client_version_history!"=="true" (
        for /f "usebackq tokens=1,* delims=:" %%c in ("!temp_file!") do (
            set "client_file_name=%%c"
            if "!client_file_name!"=="!server_file_name!" (
                set "client_file_exists=true"
                set "client_file_version=%%d"
                echo Client File - !server_file_name! : Client Version - !client_file_version!
                if not "!client_file_version!"=="!server_file_version!" (
                    echo Client File - !server_file_name!, Client version "!client_file_version!" does not match server version "!server_file_version!"
                    :: Download the optional file
                    curl -# -o "%local_directory%Data!server_file_name!" "%server_base_url%optional/!server_file_name!"
                    :: Remove the old version from the temp file
                    findstr /V "!client_file_name!:!client_file_version!" "!temp_file!" > "!temp_temp_file!"
                    copy /y "!temp_temp_file!" "!temp_file!"
                    del "!temp_temp_file!"
                    :: Add the new version to the temp file
                    echo !server_file_name!:!server_file_version!>>"!temp_file!"
                    set "versions_updated=true"
                )
            )
        )
    ) 

    :: If the file was missing from the client version list download it
    if not defined client_file_exists (
        echo No Client Version History For This File
        :: Download the optional file
        curl -# -o "%local_directory%Data!server_file_name!" "%server_base_url%optional/!server_file_name!"
        :: Update temp file with the new version
        echo !server_file_name!:!server_file_version!>>"!temp_file!"
        set "versions_updated=true"
    )

    :: Replace client_versions.txt with the updated content
    if "!versions_updated!"=="true" (
        echo Updating client version history
        copy /y "!temp_file!" "!versions_file!"   
    )
)

:: Delete existing temp files if it exists
if exist "!temp_file!" (
    del "!temp_file!"
)

::pause
endlocal

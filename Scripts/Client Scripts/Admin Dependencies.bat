:: Installs the dependencies needed for the client updater to run
:: Place in any directory and run as admin

:: Installs Choco
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: Installs GIT
choco install git -y

:: Installs Wget
choco install wget -y
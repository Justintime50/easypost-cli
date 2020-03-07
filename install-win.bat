:: Install easypost-cli on Windows

@echo off
echo Installing the EasyPost CLI...
set VERSION=1.0.0-beta
set LOCATION="C:\easypost-cli"
mkdir %LOCATION%
cd %LOCATION%
curl -LJOs https://raw.githubusercontent.com/justintime50/easypost-cli/master/executables/windows/easypost-cli-%VERSION%.zip
PowerShell Expand-Archive "C:\easypost-cli\easypost-cli-%VERSION%.zip" "C:\easypost-cli"

echo Attempting to install jq...
choco install jq

echo EasyPost CLI installed! Make sure to setup your API key.

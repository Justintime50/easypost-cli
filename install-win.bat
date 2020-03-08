:: Install easypost-cli on Windows

@echo off
echo Installing the EasyPost CLI...
set VERSION=1.0.0-beta
set LOCATION="C:\easypost-cli"
mkdir %LOCATION%
cd %LOCATION%
curl -LJOs https://raw.githubusercontent.com/justintime50/easypost-cli/master/executables/windows/easypost-cli-%VERSION%.tgz
tar -xf easypost-cli-%VERSION%.tgz

echo Attempting to install jq...
choco install jq

del /f easypost-cli-%VERSION%.tgz

echo EasyPost CLI installed! Make sure to setup your API key.

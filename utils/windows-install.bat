:install_windows
    :: Install the EasyPost CLI on Windows
    @echo off
    echo Installing the EasyPost CLI...
    set LOCATION="C:\easypost-cli"
    if not exist %LOCATION% mkdir %LOCATION%
    cd %LOCATION%
    curl -LJOs https://raw.githubusercontent.com/justintime50/easypost-cli/master/dist/windows_ep.bat
    rename windows_ep.bat ep.bat
    echo Attempting to install jq from Chocolatey...
    choco install jq
    echo EasyPost CLI installed! Make sure to setup your API key.
EXIT /B 0

call install_windows

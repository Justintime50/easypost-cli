:::::::::::::::::::::::::::::::::::::::::::::::
:: EASYPOST CLI
:: https://github.com/Justintime50/easypost-cli
:: Author: Justintime50
:::::::::::::::::::::::::::::::::::::::::::::::

:: Setup global variables
@echo off
set EASYPOST_API_URL="https://api.easypost.com/v2"
set EASYPOST_CLI_VERSION="1.0.0"

:check_config_file
    :: Check that the config file is available
    set CONFIG_FILE=C:/easypost-cli/easypost-cli-config.bat
    if not exist {%CONFIG_FILE%} (
        echo {%CONFIG_FILE%} not found, please ensure this file exists before using the easypost-cli
        exit /b 1
    )
    else (
        call {%CONFIG_FILE%}
    )
EXIT /B 0

:check_api_key
    :: Check that the API key is set
    if {%EASYPOST_CLI_API_KEY%} == {} (
        echo The EasyPost CLI is misconfigured, please ensure your API key is set and accessible via this shell.
        exit /b 1
    )
EXIT /B 0

:check_api_url
    :: Check that the API URL is set
    if {%EASYPOST_API_URL%} == {} (
        echo The EasyPost API URL is not set. API calls cannot be sent without this variable.
        exit /b 1
    )
EXIT /B 0

call check_config_file
call check_api_key
call check_api_url

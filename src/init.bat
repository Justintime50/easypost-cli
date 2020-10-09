:::::::::::::::::::::::::::::::::::::::::::::::
:: EASYPOST CLI
:: https://github.com/Justintime50/easypost-cli
:: Author: Justintime50
:::::::::::::::::::::::::::::::::::::::::::::::

:: Init Functions

:main
    :: Run this main function anytime the CLI is used
    @echo off
    set EASYPOST_API_URL="https://api.easypost.com/v2"
    set EASYPOST_CLI_VERSION="VERSION_PLACEHOLDER"

    call :check_config_file
    call :check_api_key
    call :check_api_url
    call :command_router %1
exit /b 0

:check_config_file
    :: Check that the config file is available
    call C:/easypost-cli/easypost-cli-config.bat 2>null || (echo C:/easypost-cli/easypost-cli-config.bat not found, please ensure this file exists before using the easypost-cli. & exit /b 1)
exit /b 0

:check_api_key
    :: Check that the API key is set
    if not defined EASYPOST_CLI_API_KEY (
        echo The EasyPost CLI is misconfigured, please ensure your API key is set and accessible via this shell.
        exit /b 1
    )
exit /b 0

:check_api_url
    :: Check that the API URL is set
    if not defined EASYPOST_API_URL (
        echo The EasyPost API URL is not set. API calls cannot be sent without this variable.
        exit /b 1
    )
exit /b 0

:command_router
    :: Check if the command passed is valid or not. 
    :: Run if it is a valid command, warn and exit if it is not.
    call :%1 2>null || (echo "%1" is not an EasyPost CLI command, please try again. & exit /b 1)
exit /b 0

:: Endpoint Functions

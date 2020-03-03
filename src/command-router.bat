:::::::::::::::::::::::::::::::::::::::::::::::
:: EASYPOST CLI
:: https://github.com/Justintime50/easypost-cli
:: Author: Justintime50
:::::::::::::::::::::::::::::::::::::::::::::::

:: Setup some variables
@echo off
call C:/easypost-cli/easypost-cli-config.bat
set EASYPOST_API_URL=https://api.easypost.com/v2
set EASYPOST_CLI_VERSION=1.0.0

:: Check that the API key is set (declared in the shell profile)
if {%EASYPOST_CLI_API_KEY%} == {} (
    echo The EasyPost CLI is misconfigured, please ensure your API key is set and accessible via this shell.
)
:: Check that the API URL is set
if {%EASYPOST_API_URL%} == {} (
    echo The EasyPost API URL is not set. API calls cannot be sent without this variable.
)

:: Command router
call :%1
goto :eof
:: TODO: need a way to verify a command and show an error if the command does not exist
:: https://stackoverflow.com/questions/54571949/possible-to-run-call-a-function-in-a-batch-file-directly-from-cmd

:: Endpoint Functions


:command_router
    :: Command Router: Check if the command passed is valid or not. 
    :: Run if it is a valid command, warn and exit if it is not.
    call :%1
    echo :%1 is not an EasyPost CLI command, please try again.
    exit /b 1
EXIT /B 0

call command_router :%1

:: Endpoint Functions

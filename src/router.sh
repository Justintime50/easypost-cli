
# shellcheck disable=SC2148

command_router() {
    # Command Router: Check if the command passed is valid or not. 
    # Run if it is a valid command, warn and exit if it is not.
    # shellcheck disable=SC2039,SC2169
    if declare -f "$1" > /dev/null
    then
        # Pass in the argument (command - function)
        "$@"
    else
        # Tell the user their command is not valid
        printf "%s\n" "\"$1\" is not an EasyPost CLI command, please try again." >&2
        exit 1
    fi
}

command_router "$@"

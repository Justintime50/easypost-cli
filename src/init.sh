################################################
# EASYPOST CLI
# https://github.com/Justintime50/easypost-cli
# Author: Justintime50
################################################

# Init Functions
# shellcheck disable=SC1090,SC1091

main() {
    # Run this main function anytime the CLI is used
    EASYPOST_API_URL="https://api.easypost.com/v2"
    EASYPOST_CLI_VERSION="VERSION_PLACEHOLDER"

    check_config_file
    check_api_key
    check_api_url
    command_router "$1"
}

check_config_file() {
    # Check that the config file is available
    . "$HOME/.easypost-cli-config" > /dev/null 2>&1 || { printf "%s\n" "\"~/.easypost-cli-config\" not found, please ensure this file exists before using the easypost-cli."; exit 1; }
}

check_api_key() {
    # Check that the API key is set
    if [ -z "$EASYPOST_CLI_API_KEY" ] ; then
        printf "%s\n" "The EasyPost CLI is misconfigured, please ensure your API key is set and accessible via this shell."
        exit 1
    fi
}

check_api_url() {
    # Check that the API URL is set
    if [ -z "$EASYPOST_API_URL" ] ; then
        printf "%s\n" "The EasyPost API URL is not set. API calls cannot be sent without this variable."
        exit 1
    fi
}

command_router() {
    # Check if the command passed is valid or not. 
    # Run if it is a valid command, warn and exit if it is not.
    if type -t "$1" > /dev/null
    then
        "$1"
    else
        printf "%s\n" "\"$1\" is not an EasyPost CLI command, please try again." >&2
        exit 1
    fi
}

# Endpoint Functions

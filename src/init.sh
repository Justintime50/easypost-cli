
# shellcheck disable=SC2148

################################################
# EASYPOST CLI
# https://github.com/Justintime50/easypost-cli
# Author: Justintime50
################################################

# Setup global variables
EASYPOST_API_URL="https://api.easypost.com/v2"
# shellcheck disable=SC2034
EASYPOST_CLI_VERSION="1.0.0"

check_config_file() {
    # Check that the config file is available
    # shellcheck disable=SC1090
    . "$HOME/.easypost-cli-config" > /dev/null 2>&1 || { printf "%s\n" "\"~/.easypost-cli-config\" not found, please ensure this file exists before using the easypost-cli"; exit 1; }
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

check_config_file
check_api_key
check_api_url

# Endpoint Functions

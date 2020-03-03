
################################################
# EASYPOST CLI
# https://github.com/Justintime50/easypost-cli
# Author: Justintime50
################################################

# Specify some variables
EASYPOST_API_URL="https://api.easypost.com/v2"
EASYPOST_CLI_VERSION="1.0.0-beta"
# shellcheck disable=SC1090
. "$HOME"/.easypost-cli-config

# Check that the API key is set (declared in the shell profile)
if [ -z "$EASYPOST_CLI_API_KEY" ] ; then
    printf "%s\n" "The EasyPost CLI is misconfigured, please ensure your API key is set and accessible via this shell."
    exit 1
fi
# Check that the API URL is set
if [ -z "$EASYPOST_API_URL" ] ; then
    printf "%s\n" "The EasyPost API URL is not set. API calls cannot be sent without this variable."
    exit 1
fi

# Endpoint Functions

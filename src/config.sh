#!/bin/bash

# Configure the EasyPost CLI
EASYPOST_CLI_API_KEY=
EASYPOST_CLI_LOCATION="/usr/local/bin"
EASYPOST_API_URL="https://api.easypost.com/v2"

# Check that variables are set
if [[ -z "$EASYPOST_CLI_API_KEY" ]] || [[ -z "$EASYPOST_CLI_API_KEY" ]] || [[ -z "$EASYPOST_CLI_API_KEY" ]] ; then
    echo "The EasyPost CLI is misconfigured, please see the ep executable and fix any variables that aren't set correctly."
    exit 1
fi

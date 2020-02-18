#!/bin/bash

# Import config
# shellcheck disable=SC1090
source "$HOME"/.easypost-cli/.config

# Check that variables are set
if [[ -z "$EASYPOST_CLI_API_KEY" ]] || [[ -z "$EASYPOST_CLI_API_KEY" ]] || [[ -z "$EASYPOST_CLI_API_KEY" ]] ; then
    echo "The EasyPost CLI is misconfigured, please see the ep executable and fix any variables that aren't set correctly."
    exit 1
fi

#!/bin/bash

echo "Uninstalling the EasyPost CLI..."
EASYPOST_CLI_LOCATION="/usr/local/bin"

# If the EasyPost CLI exists, remove it
if [[ -f "$EASYPOST_CLI_LOCATION"/ep ]] ; then
    rm -f "$EASYPOST_CLI_LOCATION"/ep
    echo "EasyPost CLI uninstalled!"
else
    echo "The EasyPost CLI is not installed or was not found in its default location, exiting."
fi

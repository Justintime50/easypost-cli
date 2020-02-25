#!/bin/bash

echo "Uninstalling the EasyPost CLI..."
EASYPOST_CLI_LOCATION="/usr/local/bin"
EASYPOST_CLI_HOME_LOCATION="$HOME/.easypost-cli"

# If the EasyPost CLI executable exists, remove it
if [ -f "$EASYPOST_CLI_LOCATION"/ep ] ; then
    rm -f "$EASYPOST_CLI_LOCATION"/ep
    echo "EasyPost CLI executable uninstalled!"
else
    echo "The EasyPost CLI executable is not installed or was not found in its default location."
fi

# If the EasyPost CLI home folder exists, remove it
if [ -d "$EASYPOST_CLI_HOME_LOCATION" ] ; then
    rm -rf "$EASYPOST_CLI_HOME_LOCATION"
    echo "EasyPost CLI home folder uninstalled!"
else
    echo "The EasyPost CLI home folder is not installed or was not found in its default location."
fi

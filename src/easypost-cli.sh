#!/bin/bash

# Source all library files
EASYPOST_CLI_LOCATION="$HOME"/easypost-cli
source "$EASYPOST_CLI_LOCATION"/.env

for FILE in "$EASYPOST_CLI_LOCATION"/bin/* ; do
   source $FILE
done

# TODO: Check for `curl` before running commands
# TODO: Check for `cat` and give warning if not present for docs

#!/bin/bash

# Source all library files
EASYPOST_CLI_LOCATION="$HOME/easypost-cli"
cd "$EASYPOST_CLI_LOCATION"

cd billing
for FILE in *; do
   source $FILE
done
cd ..

cd core
for FILE in *; do
   source $FILE
done
cd ..

cd create
for FILE in *; do
   source $FILE
done
cd ..

cd retrieve
for FILE in *; do
   source $FILE
done
cd ..

# TODO: Check for `curl` before running commands
# TODO: Check for `cat` and give warning if not present

#!/bin/bash

# Check if the command passed is valid or not
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "'$1' is not an EasyPost CLI command." >&2
  exit 1
fi

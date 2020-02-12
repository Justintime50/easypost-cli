#!/bin/bash

# shellcheck disable=SC1090
source "${BASH_SOURCE%/*}/../.env"

# Prompt user for input
echo "Enter address ID:"
read -r ADDRESS

# Build curl request
curl -s -X GET https://api.easypost.com/v2/addresses/"$ADDRESS" \
  -u "$EASYPOST_API_KEY": \
  | json_pp 

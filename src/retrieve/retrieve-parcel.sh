#!/bin/bash

# shellcheck disable=SC1090
source "${BASH_SOURCE%/*}/../.env"

# Prompt user for input
echo "Enter parcel ID:"
read -r PARCEL

# Build curl request
curl -s -X GET https://api.easypost.com/v2/parcels/"$PARCEL" \
  -u "$EASYPOST_API_KEY": \
  | json_pp 

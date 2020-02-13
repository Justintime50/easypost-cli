#!/bin/bash

function ep-retrieve-insurance {
    # Prompt user for input
    echo "Enter insurance ID:"
    read -r INSURANCE

    # Build curl request
    curl -s -X GET https://api.easypost.com/v2/insurances/"$INSURANCE" \
    -u "$EASYPOST_API_KEY": \
    | json_pp 
}

#!/bin/bash

function ep-retrieve-api-keys {
    # Build curl request
    curl -s -X GET https://api.easypost.com/v2/api_keys \
    -u "$EASYPOST_API_KEY": \
    | json_pp 
}

#!/bin/bash

function ep-retrieve-users {
    # Build curl request
    curl -s -X GET https://api.easypost.com/v2/users \
    -u "$EASYPOST_API_KEY": \
    | json_pp 
}

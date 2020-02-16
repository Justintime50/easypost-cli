function retrieve-api-keys {
    # ep retrieve-api-keys: Retrieve the API keys of the associated account
    # Build curl request
    curl -s -X GET https://api.easypost.com/v2/api_keys \
    -u "$EASYPOST_API_KEY": \
    | json_pp 
}


function retrieve-api-keys {
    # ep retrieve-api-keys: Retrieve the API keys of the associated account
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/api_keys \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}
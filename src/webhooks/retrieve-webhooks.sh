
function retrieve-webhooks {
    # ep retrieve-webhooks: Retrieve a list of webhooks

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/webhooks \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

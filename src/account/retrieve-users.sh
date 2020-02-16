function retrieve-users {
    # ep retrieve-users: Retrieve the users of the associated account
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/users \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp 
}

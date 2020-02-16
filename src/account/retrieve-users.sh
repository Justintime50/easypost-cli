function retrieve-users {
    # ep retrieve-users: Retrieve the users of the associated account
    # Build curl request
    curl -s -X GET https://api.easypost.com/v2/users \
    -u "$EASYPOST_API_KEY": \
    | json_pp 
}

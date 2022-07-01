
create_child_user() {
    # ep create_child_user: Create a child user (requires production API key)
    # Prompt user for input
    printf "%s\n" "Enter child user name: "
    read -r USER
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/users \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "user[name]=$USER" \
    | json_pp
}

retrieve_api_keys() {
    # ep retrieve_api_keys: Retrieve the API keys of the associated account
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/api_keys \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_carrier_accounts() {
    # ep retrieve_carrier_accounts: Retrieve the list of configured carrier accounts
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/carrier_accounts \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_carrier_account() {
    # ep retrieve_carrier_account: Retrieve a single configured carrier account
    # Prompt user for input
    printf "%s\n" "Enter carrier account ID: "
    read -r CARRIER

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/carrier_accounts/"$CARRIER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_carrier_types() {
    # ep retrieve_carrier_types: Retrieve the list of all carrier types available to the account of the given API key.
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/carrier_types \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_users() {
    # ep retrieve_users: Retrieve the users of the associated account
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/users \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_user() {
    # ep retrieve_user: Retrieve the users of the associated account
    # Prompt user for input
    printf "%s\n" "Enter user ID: "
    read -r USER
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/users/"$USER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

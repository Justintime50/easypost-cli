
retrieve_user() {
    # ep retrieve_user: Retrieve the users of the associated account
    # Prompt user for input
    echo "Enter user ID:"
    read -r USER
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/users/"$USER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

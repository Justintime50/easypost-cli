
retrieve_carrier_account() {
    # ep retrieve_carrier_account: Retrieve a single configured carrier account
    # Prompt user for input
    echo "Enter carrier account ID:"
    read -r CARRIER

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/carrier_accounts/"$CARRIER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

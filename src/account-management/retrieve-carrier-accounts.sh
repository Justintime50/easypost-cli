
retrieve_carrier_accounts() {
    # ep retrieve_carrier_accounts: Retrieve the list of configured carrier accounts
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/carrier_accounts \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

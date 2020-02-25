
retrieve_carrier_types() {
    # ep retrieve_carrier_types: Retrieve the list of all carrier types available to the account of the given API key.
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/carrier_types \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

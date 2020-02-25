
retrieve_addresses() {
    # ep retrieve_addresses: Retrieve a list of addresses

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/addresses \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

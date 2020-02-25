
retrieve_shipments() {
    # ep retrieve_shipments: Retrieve a list of shipments

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

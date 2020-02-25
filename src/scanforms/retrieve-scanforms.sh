
retrieve_scanforms() {
    # ep retrieve_scanforms: Retrieve a list of scanforms

    # TODO: Add date and page_size options
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/scan_forms \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

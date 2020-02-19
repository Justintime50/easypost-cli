
function retrieve-parcels {
    # ep retrieve-parcels: Retrieve a list of parcels

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/parcels \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

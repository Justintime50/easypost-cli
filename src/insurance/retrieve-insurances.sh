
function retrieve-insurances {
    # ep retrieve-insurances: Retrieve a list of insurances

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/insurances \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

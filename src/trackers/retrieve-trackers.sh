
function retrieve-trackers {
    # ep retrieve-trackers: Retrieve a list of trackers

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/trackers \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

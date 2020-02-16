function retrieve-tracker {
    # ep retrieve-tracker: Retrieve a tracker record
    # Prompt user for input
    echo "Enter tracker ID:"
    read -r TRACKER

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/trackers/"$TRACKER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

function retrieve-tracker {
    # ep retrieve-tracker: Retrieve a tracker record
    # Prompt user for input
    echo "Enter tracker ID:"
    read -r TRACKER

    # Build curl request
    curl -s -X GET https://api.easypost.com/v2/trackers/"$TRACKER" \
    -u "$EASYPOST_API_KEY": \
    | json_pp
}
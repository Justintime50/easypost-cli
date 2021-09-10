
create_tracker() {
    # ep create_tracker: Create a tracker for a shipment
    # Prompt user for input
    printf "%s\n" "Enter tracking code: "
    read -r TRACKER
    printf "%s\n" "Enter carrier (optional): "
    read -r CARRIER

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/trackers \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "tracker[tracking_code]=$TRACKER" \
    -d "tracker[carrier]=$CARRIER" \
    | json_pp
}

retrieve_tracker() {
    # ep retrieve_tracker: Retrieve a tracker record
    # Prompt user for input
    printf "%s\n" "Enter tracker ID: "
    read -r TRACKER

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/trackers/"$TRACKER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_trackers() {
    # ep retrieve_trackers: Retrieve a list of trackers

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/trackers \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

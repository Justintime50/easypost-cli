
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

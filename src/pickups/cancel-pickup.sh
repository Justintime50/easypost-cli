
cancel_pickup() {
    # ep cancel_pickup: Cancel a pickup
    printf "%s\n" "Enter a pickup ID: "
    read -r PICKUP
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/pickups/"$PICKUP"/cancel \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

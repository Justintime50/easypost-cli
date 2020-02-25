
retrieve_pickup() {
    # ep retrieve_pickup: Retrieve a single pickup
    echo "Enter a pickup ID:"
    read -r PICKUP
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/pickups/"$PICKUP" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}


buy_pickup() {
    # ep buy_pickup: Buy a pickup
    printf "%s\n" "Enter a pickup ID: "
    read -r PICKUP
    printf "%s\n" "Enter a carrier code (eg: \"UPS\"): "
    read -r CARRIER
    printf "%s\n" "Enter a service level (eg: \"Same-Day Pickup\"): "
    read -r SERVICE
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/pickups/"$PICKUP"/buy \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "carrier=$CARRIER" \
    -d "service=$SERVICE" \
    | json_pp
}

cancel_pickup() {
    # ep cancel_pickup: Cancel a pickup
    printf "%s\n" "Enter a pickup ID: "
    read -r PICKUP
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/pickups/"$PICKUP"/cancel \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

create_pickup() {
    # ep create_pickup: Create a pickup
    printf "%s\n" "Enter a shipment ID for the pickup: "
    read -r SHIPMENT
    printf "%s\n" "Enter an address ID for the pickup: "
    read -r ADDRESS
    printf "%s\n" "Enter a minimum time for the pickup (eg: 2019-10-20 17:10:00): "
    read -r MINTIME
    printf "%s\n" "Enter a maximum time for the pickup (eg: 2019-10-21 10:30:00): "
    read -r MAXTIME
    printf "%s\n" "Enter any special instructions (eg: \"Knock loudly\" - optional): "
    read -r INSTRUCTIONS

    # TODO: Allow batches to be picked up, case/switch batch or shipment
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/pickups \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "pickup[min_datetime]=$MINTIME" \
    -d "pickup[max_datetime]=$MAXTIME" \
    -d "pickup[shipment][id]=$SHIPMENT" \
    -d "pickup[address][id]=$ADDRESS" \
    -d "pickup[instructions]=$INSTRUCTIONS" \
    | json_pp
}

retrieve_pickup() {
    # ep retrieve_pickup: Retrieve a single pickup
    printf "%s\n" "Enter a pickup ID: "
    read -r PICKUP
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/pickups/"$PICKUP" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

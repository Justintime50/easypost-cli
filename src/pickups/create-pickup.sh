
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

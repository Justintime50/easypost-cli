
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


function buy-pickup {
    # ep buy-pickup: Buy a pickup
    echo "Enter a pickup ID:"
    read -r PICKUP
    echo "Enter a carrier code (eg: \"UPS\"):"
    read -r CARRIER
    echo "Enter a service level (eg: \"Same-Day Pickup\"):"
    read -r SERVICE
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/pickups/"$PICKUP"/buy \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "carrier=$CARRIER" \
    -d "service=$SERVICE" \
    | json_pp
}

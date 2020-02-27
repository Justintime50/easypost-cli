
buy_shipment() {
    # ep buy_shipment: Buy a label for the specified shipment
    # Prompt user for input
    printf "%s\n" "Enter shipment ID: "
    read -r SHIPMENT
    printf "%s\n" "Enter rate ID: "
    read -r RATE
    printf "%s\n" "Enter insurance amount (optional): "
    read -r INSURANCE

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments/"$SHIPMENT"/buy \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "rate[id]=$RATE" \
    -d "insurance=$INSURANCE" \
    | json_pp
}

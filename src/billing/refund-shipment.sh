
refund_shipment() {
    # ep refund_shipment: Refund a specified shipment
    # Prompt user for input
    printf "%s\n" "Enter shipment ID: "
    read -r SHIPMENT

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments/"$SHIPMENT"/refund \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}


regenerate_rates() {
    # ep regenerate_rates: Regenerate rates for a shipment
    # Prompt user for input
    printf "%s\n" "Enter shipment ID: "
    read -r SHIPMENT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/shipments/"$SHIPMENT"/rates \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

function regenerate-rates {
    # ep regenerate-rates: Regenerate rates for a shipment
    # Prompt user for input
    echo "Enter shipment ID:"
    read -r SHIPMENT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/shipments/"$SHIPMENT"/rates \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp 
}

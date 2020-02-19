
function retrieve-shipment {
    # ep retrieve-shipment: Retrieve a shipment record
    # Prompt user for input
    echo "Enter shipment ID:"
    read -r SHIPMENT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/shipments/"$SHIPMENT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

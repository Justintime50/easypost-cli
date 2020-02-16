function retrieve-shipment {
    # ep retrieve-shipment: Retrieve a shipment record
    # Prompt user for input
    echo "Enter shipment ID:"
    read -r SHIPMENT

    # Build curl request
    curl -s -X GET https://api.easypost.com/v2/shipments/"$SHIPMENT" \
    -u "$EASYPOST_API_KEY": \
    | json_pp
}
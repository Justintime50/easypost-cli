function create-refund {
    # ep create-refund: Create a return shipment that swaps the to and from addresses on the label
    # Prompt user for input
    echo "Enter a to_address ID:"
    read -r TO_ADDRESS
    echo "Enter a from_address ID:"
    read -r FROM_ADDRESS
    echo "Enter a parcel ID:"
    read -r PARCEL

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipment[to_address][id]=$TO_ADDRESS" \
    -d "shipment[from_address][id]=$FROM_ADDRESS" \
    -d "shipment[parcel][id]=$PARCEL" \
    -d "shipment[is_return]=true" \
    | json_pp 
}

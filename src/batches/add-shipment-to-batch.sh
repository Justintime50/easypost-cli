
add_shipment_to_batch() {
    # ep add_shipment_to_batch: Add a shipment to a batch
    # Prompt user for input
    echo "Enter a batch ID to add shipments to:"
    read -r BATCH
    echo "Enter a shipment ID to add to the batch:"
    read -r SHIPMENT

    # TODO: Allow multiple batches to be iterated here, separated by commas or something similar

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/add_shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipments[0][id]=$SHIPMENT" \
    | json_pp
}

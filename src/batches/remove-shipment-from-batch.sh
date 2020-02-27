
remove_shipment_from_batch() {
    # ep remove_shipment_from_batch: Remove a shipment from a batch
    # Prompt user for input
    printf "%s\n" "Enter a batch ID to remove shipments from: "
    read -r BATCH
    printf "%s\n" "Enter a shipment ID to remove from the batch: "
    read -r SHIPMENT

    # TODO: Allow multiple batches to be iterated here, separated by commas or something similar

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/remove_shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipments[0][id]=$SHIPMENT" \
    | json_pp
}

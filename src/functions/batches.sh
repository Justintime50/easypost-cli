
add_shipment_to_batch() {
    # ep add_shipment_to_batch: Add a shipment to a batch
    # Prompt user for input
    printf "%s\n" "Enter a batch ID to add shipments to: "
    read -r BATCH
    printf "%s\n" "Enter a shipment ID to add to the batch: "
    read -r SHIPMENT

    # TODO: Allow multiple batches to be iterated here, separated by commas or something similar

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/add_shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipments[0][id]=$SHIPMENT" \
    | json_pp
}

create_batch() {
    # ep create_batch: Create an empty batch object
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

generate_batch_label() {
    # ep generate_batch_label: Generate a label for a batch of shipments
    # Prompt user for input
    FORMAT="null"
    printf "%s\n" "Enter a batch ID to generate a label for: "
    read -r BATCH
    # while ! [ $FORMAT = "pdf" ] || [ $FORMAT = "PDF" ] || [ $FORMAT = "zpl" ] || [ $FORMAT = "ZPL" ] || [ $FORMAT = "epl2" ] || [ $FORMAT = "EPL2" ] ; do
    #     printf "%s\n" "Enter a label format (options: pdf, zpl, epl2): "
    #     read -r FORMAT
    #     if [ -z "$FORMAT" ] ; then
    #         printf "%s\n" "Format cannot be blank"
    #     fi
    # done

    # Allow the user to choose
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/label \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "label_format=$FORMAT" \
    | json_pp
}

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

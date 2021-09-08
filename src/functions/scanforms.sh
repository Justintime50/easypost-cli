
manifest_batch() {
    # ep manifest_batch: Manifest or scanform a batch
    printf "%s\n" "Enter a batch ID you'd like to manifest: "
    read -r BATCH
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/scan_form \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_scanform() {
    # ep retrieve_scanform: Retrieve a single scanform
    printf "%s\n" "Enter a scanform ID: "
    read -r SCANFORM
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/scan_forms/"$SCANFORM" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_scanforms() {
    # ep retrieve_scanforms: Retrieve a list of scanforms

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/scan_forms \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}


function manifest-batch {
    # ep manifest-batch: Manifest or scanform a batch
    echo "Enter a batch ID you'd like to manifest:"
    read -r BATCH
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/scan_form \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

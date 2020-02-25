
create_batch() {
    # ep create_batch: Create an empty batch object
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

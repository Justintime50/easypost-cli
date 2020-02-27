
retrieve_scanform() {
    # ep retrieve_scanform: Retrieve a single scanform
    printf "%s\n" "Enter a scanform ID: "
    read -r SCANFORM
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/scan_forms/"$SCANFORM" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

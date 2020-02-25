
function retrieve-scanform {
    # ep retrieve-scanform: Retrieve a single scanform
    echo "Enter a scanform ID:"
    read -r SCANFORM
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/scan_forms/"$SCANFORM" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

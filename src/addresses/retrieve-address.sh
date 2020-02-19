
function retrieve-address {
    # ep retrieve-address: Retrieve an address record
    # Prompt user for input
    echo "Enter address ID:"
    read -r ADDRESS

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/addresses/"$ADDRESS" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

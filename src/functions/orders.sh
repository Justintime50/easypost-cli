
retrieve_order() {
    # ep retrieve_order: Retrieve a order record
    # Prompt user for input
    printf "%s\n" "Enter order ID: "
    read -r order

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/orders/"$order" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

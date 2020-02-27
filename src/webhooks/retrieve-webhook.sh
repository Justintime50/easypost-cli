
retrieve_webhook() {
    # ep retrieve_webhook: Retrieve a list of webhooks
    # Prompt user for input
    printf "%s\n" "Enter a webhook ID: "
    read -r WEBHOOK

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/webhooks/"$WEBHOOK" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

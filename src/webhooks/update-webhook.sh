
update_webhook() {
    # ep update_webhook: Enables a Webhook that has been disabled.
    # Prompt user for input
    printf "%s\n" "Enter a webhook ID: "
    read -r WEBHOOK

    # Build curl request
    curl -s -X PUT "$EASYPOST_API_URL"/webhooks/"$WEBHOOK" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

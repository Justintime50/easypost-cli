
function delete-webhook {
    # ep delete-webhook: Enables a Webhook that has been disabled.
    # Prompt user for input
    echo "Enter a webhook ID:"
    read -r WEBHOOK

    # Build curl request
    curl -s -X DELETE "$EASYPOST_API_URL"/webhooks/"$WEBHOOK" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

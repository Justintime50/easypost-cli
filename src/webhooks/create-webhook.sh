
create_webhook() {
    # ep create_webhooks: Create a webhook
    # Prompt user for input
    printf "%s\n" "Enter the webhook URL: "
    read -r WEBHOOK

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/webhooks \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "webhook[url]=$WEBHOOK" \
    | json_pp
}

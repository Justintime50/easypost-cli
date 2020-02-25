
function create-webhook {
    # ep create-webhooks: Create a webhook
    # Prompt user for input
    echo "Enter the webhook URL:"
    read -r WEBHOOK

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/webhooks \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "webhook[url]=$WEBHOOK" \
    | json_pp
}


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

retrieve_webhooks() {
    # ep retrieve_webhooks: Retrieve a list of webhooks

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/webhooks \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

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

delete_webhook() {
    # ep delete_webhook: Enables a Webhook that has been disabled.
    # Prompt user for input
    printf "%s\n" "Enter a webhook ID: "
    read -r WEBHOOK

    # Build curl request
    curl -s -X DELETE "$EASYPOST_API_URL"/webhooks/"$WEBHOOK" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

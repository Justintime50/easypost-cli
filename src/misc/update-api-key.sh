function update-api-key {
    # ep update-api-key: Update the stored API key in the `ep` executable
    EASYPOST_CLI_LOCATION="/usr/local/bin"
    echo "Enter your EasyPost API key:"
    read -r KEY
    # TODO: Fix the EasyPost API replacement here
    sed -i '' -e "s/EASYPOST_CLI_API_KEY=$EASYPOST_CLI_API_KEY/EASYPOST_CLI_API_KEY=$KEY/g" "$EASYPOST_CLI_LOCATION"/ep
    echo "Your EasyPost API key has been updated!"
}

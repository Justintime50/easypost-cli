
update_api_key() {
    # ep update_api_key: Update the stored API key in the EasyPost CLI config file
    printf "%s\n" "Enter your EasyPost API key: "
    read -r EASYPOST_CLI_API_KEY
    sed -i '' "s/EASYPOST_CLI_API_KEY=.*/EASYPOST_CLI_API_KEY=$EASYPOST_CLI_API_KEY/" "$EASYPOST_CLI_HOME_LOCATION"/.config
    printf "%s\n" "Your EasyPost API key has been updated!"
}

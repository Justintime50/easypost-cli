
retrieve_insurance() {
    # ep retrieve_insurance: Retrieve an insurnace record
    # Prompt user for input
    echo "Enter insurance ID:"
    read -r INSURANCE

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/insurances/"$INSURANCE" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

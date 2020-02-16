function retrieve-insurance {
    # ep retrieve-insurance: Retrieve an insurnace record
    # Prompt user for input
    echo "Enter insurance ID:"
    read -r INSURANCE

    # Build curl request
    curl -s -X GET https://api.easypost.com/v2/insurances/"$INSURANCE" \
    -u "$EASYPOST_API_KEY": \
    | json_pp 
}

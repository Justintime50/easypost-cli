
create_insurance() {
    # ep create_insurance: Create an insurance record for shipments not from EasyPost
    # Prompt user for input
    printf "%s\n" "Enter to address ID: "
    read -r TO_ADDRESS
    printf "%s\n" "Enter from address ID: "
    read -r FROM_ADDRESS
    printf "%s\n" "Enter tracking code from the carrier: "
    read -r TRACKING
    printf "%s\n" "Enter carrier (optional, recommended): "
    read -r CARRIER
    printf "%s\n" "Enter external reference ID (optional): "
    read -r REFERENCE
    printf "%s\n" "Enter amount to insure: "
    read -r AMOUNT

    # Build Curl Request
    curl -s -X POST "$EASYPOST_API_URL"/insurances \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "insurance[to_address][id]=$TO_ADDRESS" \
    -d "insurance[from_address][id]=$FROM_ADDRESS" \
    -d "insurance[tracking_code]=$TRACKING" \
    -d "insurance[carrier]=$CARRIER" \
    -d "insurance[reference]=$REFERENCE" \
    -d "insurance[amount]=$AMOUNT" \
    | json_pp
}

retrieve_insurances() {
    # ep retrieve_insurances: Retrieve a list of insurances

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/insurances \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_insurance() {
    # ep retrieve_insurance: Retrieve an insurnace record
    # Prompt user for input
    printf "%s\n" "Enter insurance ID: "
    read -r INSURANCE

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/insurances/"$INSURANCE" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

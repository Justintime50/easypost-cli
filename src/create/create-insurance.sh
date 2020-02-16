function create-insurance {
    # ep create-insurance: Create an insurance record for shipments not from EasyPost
    # Prompt user for input
    echo "Enter to address ID:"
    read -r TO_ADDRESS
    echo "Enter from address ID:"
    read -r FROM_ADDRESS
    echo "Enter tracking code from the carrier:"
    read -r TRACKING
    echo "Enter carrier (optional, recommended):"
    read -r CARRIER
    echo "Enter external reference ID (optional):"
    read -r REFERENCE
    echo "Enter amount to insure:"
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

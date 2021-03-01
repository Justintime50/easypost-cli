
buy_shipment() {
    # ep buy_shipment: Buy a label for the specified shipment
    # Prompt user for input
    printf "%s\n" "Enter shipment ID: "
    read -r SHIPMENT
    printf "%s\n" "Enter rate ID: "
    read -r RATE
    printf "%s\n" "Enter insurance amount (optional): "
    read -r INSURANCE

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments/"$SHIPMENT"/buy \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "rate[id]=$RATE" \
    -d "insurance=$INSURANCE" \
    | json_pp
}

buy_stamp() {
    # ep buy_stamp: Purchases a single USPS domestic stamp and creates a #10 letter size label to print onto a standard envelope
    # Prompt user for input
    printf "%s\n" "Enter to_street1: "
    read -r TO_STREET1
    printf "%s\n" "Enter to_street2 (optional): "
    read -r TO_STREET2
    printf "%s\n" "Enter to_city: "
    read -r TO_CITY
    printf "%s\n" "Enter to_state: "
    read -r TO_STATE
    printf "%s\n" "Enter to_zip: "
    read -r TO_ZIP
    printf "%s\n" "Enter to_name (optional): "
    read -r TO_NAME
    printf "%s\n" "Enter to_company (optional): "
    read -r TO_COMPANY
    printf "%s\n" "Enter to_phone (optional): "
    read -r TO_PHONE
    printf "%s\n" "Enter to_email (optional): "
    read -r TO_EMAIL

    printf "%s\n" "Enter from_street1: "
    read -r FROM_STREET1
    printf "%s\n" "Enter from_street2 (optional): "
    read -r FROM_STREET2
    printf "%s\n" "Enter from_city: "
    read -r FROM_CITY
    printf "%s\n" "Enter from_state: "
    read -r FROM_STATE
    printf "%s\n" "Enter from_zip: "
    read -r FROM_ZIP
    printf "%s\n" "Enter from_name (optional): "
    read -r FROM_NAME
    printf "%s\n" "Enter from_company (optional): "
    read -r FROM_COMPANY
    printf "%s\n" "Enter from_phone (optional): "
    read -r FROM_PHONE
    printf "%s\n" "Enter from_email (optional): "
    read -r FROM_EMAIL

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipment[to_address][street1]=$TO_STREET1" \
    -d "shipment[to_address][street2]=$TO_STREET2" \
    -d "shipment[to_address][city]=$TO_CITY" \
    -d "shipment[to_address][state]=$TO_STATE" \
    -d "shipment[to_address][zip]=$TO_ZIP" \
    -d "shipment[to_address][country]=US" \
    -d "shipment[to_address][name]=$TO_NAME" \
    -d "shipment[to_address][company]=$TO_COMPANY" \
    -d "shipment[to_address][phone]=$TO_PHONE" \
    -d "shipment[to_address][email]=$TO_EMAIL" \
    -d "shipment[from_address][street1]=$FROM_STREET1" \
    -d "shipment[from_address][street2]=$FROM_STREET2" \
    -d "shipment[from_address][city]=$FROM_CITY" \
    -d "shipment[from_address][state]=$FROM_STATE" \
    -d "shipment[from_address][zip]=$FROM_ZIP" \
    -d "shipment[from_address][country]=US" \
    -d "shipment[from_address][name]=$FROM_NAME" \
    -d "shipment[from_address][company]=$FROM_COMPANY" \
    -d "shipment[from_address][phone]=$FROM_PHONE" \
    -d "shipment[from_address][email]=$FROM_EMAIL" \
    -d "shipment[parcel][weight]=1" \
    -d "shipment[parcel][predefined_package]=Letter" \
    -d "shipment[service]=First" \
    -d "shipment[carrier]=USPS" \
    | json_pp
}

create_return() {
    # ep create_return: Create a return shipment that swaps the to and from addresses on the label (requires address and parcel IDs)
    # Prompt user for input
    printf "%s\n" "Enter a to_address ID: "
    read -r TO_ADDRESS
    printf "%s\n" "Enter a from_address ID: "
    read -r FROM_ADDRESS
    printf "%s\n" "Enter a parcel ID: "
    read -r PARCEL

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipment[to_address][id]=$TO_ADDRESS" \
    -d "shipment[from_address][id]=$FROM_ADDRESS" \
    -d "shipment[parcel][id]=$PARCEL" \
    -d "shipment[is_return]=true" \
    | json_pp
}

create_shipment() {
    # ep create_shipment: Create a shipment record that can then be used to purchase a label
    # Prompt user for input
    printf "%s\n" "Enter to_street1: "
    read -r TO_STREET1
    printf "%s\n" "Enter to_street2 (optional): "
    read -r TO_STREET2
    printf "%s\n" "Enter to_city: "
    read -r TO_CITY
    printf "%s\n" "Enter to_state: "
    read -r TO_STATE
    printf "%s\n" "Enter to_zip: "
    read -r TO_ZIP
    printf "%s\n" "Enter to_country (optional): "
    read -r TO_COUNTRY
    printf "%s\n" "Enter to_name (optional): "
    read -r TO_NAME
    printf "%s\n" "Enter to_company (optional): "
    read -r TO_COMPANY
    printf "%s\n" "Enter to_phone (optional): "
    read -r TO_PHONE
    printf "%s\n" "Enter to_email (optional): "
    read -r TO_EMAIL

    printf "%s\n" "Enter from_street1: "
    read -r FROM_STREET1
    printf "%s\n" "Enter from_street2 (optional): "
    read -r FROM_STREET2
    printf "%s\n" "Enter from_city: "
    read -r FROM_CITY
    printf "%s\n" "Enter from_state: "
    read -r FROM_STATE
    printf "%s\n" "Enter from_zip: "
    read -r FROM_ZIP
    printf "%s\n" "Enter from_country (optional): "
    read -r FROM_COUNTRY
    printf "%s\n" "Enter from_name (optional): "
    read -r FROM_NAME
    printf "%s\n" "Enter from_company (optional): "
    read -r FROM_COMPANY
    printf "%s\n" "Enter from_phone (optional): "
    read -r FROM_PHONE
    printf "%s\n" "Enter from_email (optional): "
    read -r FROM_EMAIL

    printf "%s\n" "Enter parcel length: "
    read -r LENGTH
    printf "%s\n" "Enter parcel width: "
    read -r WIDTH
    printf "%s\n" "Enter parcel height: "
    read -r HEIGHT
    printf "%s\n" "Enter parcel weight: "
    read -r WEIGHT

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipment[to_address][street1]=$TO_STREET1" \
    -d "shipment[to_address][street2]=$TO_STREET2" \
    -d "shipment[to_address][city]=$TO_CITY" \
    -d "shipment[to_address][state]=$TO_STATE" \
    -d "shipment[to_address][zip]=$TO_ZIP" \
    -d "shipment[to_address][country]=$TO_COUNTRY" \
    -d "shipment[to_address][name]=$TO_NAME" \
    -d "shipment[to_address][company]=$TO_COMPANY" \
    -d "shipment[to_address][phone]=$TO_PHONE" \
    -d "shipment[to_address][email]=$TO_EMAIL" \
    -d "shipment[from_address][street1]=$FROM_STREET1" \
    -d "shipment[from_address][street2]=$FROM_STREET2" \
    -d "shipment[from_address][city]=$FROM_CITY" \
    -d "shipment[from_address][state]=$FROM_STATE" \
    -d "shipment[from_address][zip]=$FROM_ZIP" \
    -d "shipment[from_address][country]=$FROM_COUNTRY" \
    -d "shipment[from_address][name]=$FROM_NAME" \
    -d "shipment[from_address][company]=$FROM_COMPANY" \
    -d "shipment[from_address][phone]=$FROM_PHONE" \
    -d "shipment[from_address][email]=$FROM_EMAIL" \
    -d "shipment[parcel][length]=$LENGTH" \
    -d "shipment[parcel][width]=$WIDTH" \
    -d "shipment[parcel][height]=$HEIGHT" \
    -d "shipment[parcel][weight]=$WEIGHT" \
    | json_pp
}

refund_shipment() {
    # ep refund_shipment: Refund a specified shipment
    # Prompt user for input
    printf "%s\n" "Enter shipment ID: "
    read -r SHIPMENT

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments/"$SHIPMENT"/refund \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

regenerate_rates() {
    # ep regenerate_rates: Regenerate rates for a shipment
    # Prompt user for input
    printf "%s\n" "Enter shipment ID: "
    read -r SHIPMENT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/shipments/"$SHIPMENT"/rates \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipment() {
    # ep retrieve_shipment: Retrieve a shipment record
    # Prompt user for input
    printf "%s\n" "Enter shipment ID: "
    read -r SHIPMENT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/shipments/"$SHIPMENT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipments() {
    # ep retrieve_shipments: Retrieve a list of shipments

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

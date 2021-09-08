
create_address() {
    # ep create_address: Create an address record
    # Prompt user for input
    printf "%s\n" "Enter street1: "
    read -r STREET1
    printf "%s\n" "Enter street2 (optional): "
    read -r STREET2
    printf "%s\n" "Enter city: "
    read -r CITY
    printf "%s\n" "Enter state: "
    read -r STATE
    printf "%s\n" "Enter zip: "
    read -r ZIP
    printf "%s\n" "Enter country (optional): "
    read -r COUNTRY
    printf "%s\n" "Enter name (optional): "
    read -r NAME
    printf "%s\n" "Enter company (optional): "
    read -r COMPANY
    printf "%s\n" "Enter phone (optional): "
    read -r PHONE
    printf "%s\n" "Enter email (optional): "
    read -r EMAIL

    # Build Curl Request
    curl -s -X POST "$EASYPOST_API_URL"/addresses \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "address[street1]=$STREET1" \
    -d "address[street2]=$STREET2" \
    -d "address[city]=$CITY" \
    -d "address[state]=$STATE" \
    -d "address[zip]=$ZIP" \
    -d "address[country]=$COUNTRY" \
    -d "address[name]=$NAME" \
    -d "address[company]=$COMPANY" \
    -d "address[phone]=$PHONE" \
    -d "address[email]=$EMAIL" \
    | json_pp
}

retrieve_address() {
    # ep retrieve_address: Retrieve an address record
    # Prompt user for input
    printf "%s\n" "Enter address ID: "
    read -r ADDRESS

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/addresses/"$ADDRESS" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_addresses() {
    # ep retrieve_addresses: Retrieve a list of addresses

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/addresses \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

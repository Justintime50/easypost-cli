
function create-address {
    # ep create-address: Create an address record
    # Prompt user for input
    echo "Enter street1:"
    read -r STREET1
    echo "Enter street2 (optional):"
    read -r STREET2
    echo "Enter city:"
    read -r CITY
    echo "Enter state:"
    read -r STATE
    echo "Enter zip:"
    read -r ZIP
    echo "Enter country (optional):"
    read -r COUNTRY
    echo "Enter name (optional):"
    read -r NAME
    echo "Enter company (optional):"
    read -r COMPANY
    echo "Enter phone (optional):"
    read -r PHONE
    echo "Enter email (optional):"
    read -r EMAIL

    # TODO: Prompt to verify address or not

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
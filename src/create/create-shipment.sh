function create-shipment {
    # ep create-shipment: Create a shipment record that can then be used to purchase a label
    # Prompt user for input
    echo "Enter to_street1:"
    read -r TO_STREET1
    echo "Enter to_street2 (optional):"
    read -r TO_STREET2
    echo "Enter to_city:"
    read -r TO_CITY
    echo "Enter to_state:"
    read -r TO_STATE
    echo "Enter to_zip:"
    read -r TO_ZIP
    echo "Enter to_country (optional):"
    read -r TO_COUNTRY
    echo "Enter to_name (optional):"
    read -r TO_NAME
    echo "Enter to_company (optional):"
    read -r TO_COMPANY
    echo "Enter to_phone (optional):"
    read -r TO_PHONE
    echo "Enter to_email (optional):"
    read -r TO_EMAIL

    echo "Enter from_street1:"
    read -r FROM_STREET1
    echo "Enter from_street2 (optional):"
    read -r FROM_STREET2
    echo "Enter from_city:"
    read -r FROM_CITY
    echo "Enter from_state:"
    read -r FROM_STATE
    echo "Enter from_zip:"
    read -r FROM_ZIP
    echo "Enter from_country (optional):"
    read -r FROM_COUNTRY
    echo "Enter from_name (optional):"
    read -r FROM_NAME
    echo "Enter from_company (optional):"
    read -r FROM_COMPANY
    echo "Enter from_phone (optional):"
    read -r FROM_PHONE
    echo "Enter from_email (optional):"
    read -r FROM_EMAIL

    echo "Enter parcel length:"
    read -r LENGTH
    echo "Enter parcel width:"
    read -r WIDTH
    echo "Enter parcel height:"
    read -r HEIGHT
    echo "Enter parcel weight:"
    read -r WEIGHT

    # Build curl request
    curl -s -X POST https://api.easypost.com/v2/shipments \
    -u "$EASYPOST_API_KEY": \
    -d "address[to_address][street1]=$TO_STREET1" \
    -d "address[to_address][street2]=$TO_STREET2" \
    -d "address[to_address][city]=$TO_CITY" \
    -d "address[to_address][state]=$TO_STATE" \
    -d "address[to_address][zip]=$TO_ZIP" \
    -d "address[to_address][country]=$TO_COUNTRY" \
    -d "address[to_address][name]=$TO_NAME" \
    -d "address[to_address][company]=$TO_COMPANY" \
    -d "address[to_address][phone]=$TO_PHONE" \
    -d "address[to_address][email]=$TO_EMAIL" \
    -d "address[from_address][street1]=$FROM_STREET1" \
    -d "address[from_address][street2]=$FROM_STREET2" \
    -d "address[from_address][city]=$FROM_CITY" \
    -d "address[from_address][state]=$FROM_STATE" \
    -d "address[from_address][zip]=$FROM_ZIP" \
    -d "address[from_address][country]=$FROM_COUNTRY" \
    -d "address[from_address][name]=$FROM_NAME" \
    -d "address[from_address][company]=$FROM_COMPANY" \
    -d "address[from_address][phone]=$FROM_PHONE" \
    -d "address[from_address][email]=$FROM_EMAIL" \
    -d "parcel[length]=$LENGTH" \
    -d "parcel[width]=$WIDTH" \
    -d "parcel[height]=$HEIGHT" \
    -d "parcel[weight]=$WEIGHT" \
    | json_pp 
}

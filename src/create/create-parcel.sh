function create-parcel {
    # ep create-parcel: Create a parcel record
    # Prompt user for input
    echo "Enter parcel length:"
    read -r LENGTH
    echo "Enter parcel width:"
    read -r WIDTH
    echo "Enter parcel height:"
    read -r HEIGHT
    echo "Enter parcel weight:"
    read -r WEIGHT

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/parcels \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "parcel[length]=$LENGTH" \
    -d "parcel[width]=$WIDTH" \
    -d "parcel[height]=$HEIGHT" \
    -d "parcel[weight]=$WEIGHT" \
    | json_pp
}

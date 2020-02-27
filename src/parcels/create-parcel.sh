
create_parcel() {
    # ep create_parcel: Create a parcel record
    # Prompt user for input
    printf "%s\n" "Enter parcel length (in inches): "
    read -r LENGTH
    printf "%s\n" "Enter parcel width (in inches): "
    read -r WIDTH
    printf "%s\n" "Enter parcel height (in inches): "
    read -r HEIGHT
    printf "%s\n" "Enter parcel weight (in ounces): "
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

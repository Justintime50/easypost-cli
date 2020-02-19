
function retrieve-parcel {
    # ep retrieve-parcel: Retrieve a parcel record
    # Prompt user for input
    echo "Enter parcel ID:"
    read -r PARCEL

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/parcels/"$PARCEL" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

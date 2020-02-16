function retrieve-parcel {
    # ep retrieve-parcel: Retrieve a parcel record
    # Prompt user for input
    echo "Enter parcel ID:"
    read -r PARCEL

    # Build curl request
    curl -s -X GET https://api.easypost.com/v2/parcels/"$PARCEL" \
    -u "$EASYPOST_API_KEY": \
    | json_pp
}

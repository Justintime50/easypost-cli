#!/bin/bash

function ep-buy-shipment {
    # Prompt user for input
    echo "Enter shipment ID:"
    read -r SHIPMENT
    echo "Enter rate ID:"
    read -r RATE
    echo "Enter insurance amount (optional):"
    read -r INSURANCE

    # Build curl request
    curl -s -X POST https://api.easypost.com/v2/shipments/"$SHIPMENT"/buy \
    -u "$EASYPOST_API_KEY": \
    -d "rate[id]=$RATE" \
    -d "insurance=$INSURANCE" \
    | json_pp 
}

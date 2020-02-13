#!/bin/bash

function ep-refund-shipment {
    # Prompt user for input
    echo "Enter shipment ID:"
    read -r SHIPMENT

    # Build curl request
    curl -s -X POST https://api.easypost.com/v2/shipments/"$SHIPMENT"/refund \
    -u "$EASYPOST_API_KEY": \
    | json_pp 
}

#!/bin/bash
################################################
# EASYPOST CLI
# https://github.com/Justintime50/easypost-cli
# Author: Justintime50
################################################

# Init Functions
# shellcheck disable=SC1090,SC1091

main() {
    # Run this main function anytime the CLI is used
    EASYPOST_API_URL="https://api.easypost.com/v2"
    EASYPOST_CLI_VERSION="1.5.0"

    check_config_file
    check_api_key
    check_api_url
    command_router "$1"
}

check_config_file() {
    # Check that the config file is available
    . "$HOME/.easypost-cli-config" > /dev/null 2>&1 || { printf "%s\n" "\"~/.easypost-cli-config\" not found, please ensure this file exists before using the easypost-cli."; exit 1; }
}

check_api_key() {
    # Check that the API key is set
    if [ -z "$EASYPOST_CLI_API_KEY" ] ; then
        printf "%s\n" "The EasyPost CLI is misconfigured, please ensure your API key is set and accessible via this shell."
        exit 1
    fi
}

check_api_url() {
    # Check that the API URL is set
    if [ -z "$EASYPOST_API_URL" ] ; then
        printf "%s\n" "The EasyPost API URL is not set. API calls cannot be sent without this variable."
        exit 1
    fi
}

command_router() {
    # Check if the command passed is valid or not. 
    # Run if it is a valid command, warn and exit if it is not.
    if type "$1" > /dev/null
    then
        "$1"
    else
        printf "%s\n" "\"$1\" is not an EasyPost CLI command, please try again." >&2
        exit 1
    fi
}

# Endpoint Functions

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

add_shipment_to_batch() {
    # ep add_shipment_to_batch: Add a shipment to a batch
    # Prompt user for input
    printf "%s\n" "Enter a batch ID to add shipments to: "
    read -r BATCH
    printf "%s\n" "Enter a shipment ID to add to the batch: "
    read -r SHIPMENT

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/add_shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipments[0][id]=$SHIPMENT" \
    | json_pp
}

create_batch() {
    # ep create_batch: Create an empty batch object
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

generate_batch_label() {
    # ep generate_batch_label: Generate a label for a batch of shipments
    # Prompt user for input
    FORMAT="null"
    printf "%s\n" "Enter a batch ID to generate a label for: "
    read -r BATCH

    # Allow the user to choose
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/label \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "label_format=$FORMAT" \
    | json_pp
}

remove_shipment_from_batch() {
    # ep remove_shipment_from_batch: Remove a shipment from a batch
    # Prompt user for input
    printf "%s\n" "Enter a batch ID to remove shipments from: "
    read -r BATCH
    printf "%s\n" "Enter a shipment ID to remove from the batch: "
    read -r SHIPMENT

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/remove_shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipments[0][id]=$SHIPMENT" \
    | json_pp
}

help() {
    # ep help: Show the docs
    open https://github.com/Justintime50/easypost-cli/blob/master/docs/man.md
}

create_insurance() {
    # ep create_insurance: Create an insurance record for shipments not from EasyPost
    # Prompt user for input
    printf "%s\n" "Enter to address ID: "
    read -r TO_ADDRESS
    printf "%s\n" "Enter from address ID: "
    read -r FROM_ADDRESS
    printf "%s\n" "Enter tracking code from the carrier: "
    read -r TRACKING
    printf "%s\n" "Enter carrier (optional, recommended): "
    read -r CARRIER
    printf "%s\n" "Enter external reference ID (optional): "
    read -r REFERENCE
    printf "%s\n" "Enter amount to insure: "
    read -r AMOUNT

    # Build Curl Request
    curl -s -X POST "$EASYPOST_API_URL"/insurances \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "insurance[to_address][id]=$TO_ADDRESS" \
    -d "insurance[from_address][id]=$FROM_ADDRESS" \
    -d "insurance[tracking_code]=$TRACKING" \
    -d "insurance[carrier]=$CARRIER" \
    -d "insurance[reference]=$REFERENCE" \
    -d "insurance[amount]=$AMOUNT" \
    | json_pp
}

retrieve_insurance() {
    # ep retrieve_insurance: Retrieve an insurnace record
    # Prompt user for input
    printf "%s\n" "Enter insurance ID: "
    read -r INSURANCE

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/insurances/"$INSURANCE" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_insurances() {
    # ep retrieve_insurances: Retrieve a list of insurances

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/insurances \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_order() {
    # ep retrieve_order: Retrieve a order record
    # Prompt user for input
    printf "%s\n" "Enter order ID: "
    read -r ORDER

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/orders/"$ORDER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

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

retrieve_parcel() {
    # ep retrieve_parcel: Retrieve a parcel record
    # Prompt user for input
    printf "%s\n" "Enter parcel ID: "
    read -r PARCEL

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/parcels/"$PARCEL" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

buy_pickup() {
    # ep buy_pickup: Buy a pickup
    printf "%s\n" "Enter a pickup ID: "
    read -r PICKUP
    printf "%s\n" "Enter a carrier code (eg: \"UPS\"): "
    read -r CARRIER
    printf "%s\n" "Enter a service level (eg: \"Same-Day Pickup\"): "
    read -r SERVICE
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/pickups/"$PICKUP"/buy \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "carrier=$CARRIER" \
    -d "service=$SERVICE" \
    | json_pp
}

cancel_pickup() {
    # ep cancel_pickup: Cancel a pickup
    printf "%s\n" "Enter a pickup ID: "
    read -r PICKUP
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/pickups/"$PICKUP"/cancel \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

create_pickup() {
    # ep create_pickup: Create a pickup
    printf "%s\n" "Enter a shipment ID for the pickup: "
    read -r SHIPMENT
    printf "%s\n" "Enter an address ID for the pickup: "
    read -r ADDRESS
    printf "%s\n" "Enter a minimum time for the pickup (eg: 2019-10-20 17:10:00): "
    read -r MINTIME
    printf "%s\n" "Enter a maximum time for the pickup (eg: 2019-10-21 10:30:00): "
    read -r MAXTIME
    printf "%s\n" "Enter any special instructions (eg: \"Knock loudly\" - optional): "
    read -r INSTRUCTIONS

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/pickups \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "pickup[min_datetime]=$MINTIME" \
    -d "pickup[max_datetime]=$MAXTIME" \
    -d "pickup[shipment][id]=$SHIPMENT" \
    -d "pickup[address][id]=$ADDRESS" \
    -d "pickup[instructions]=$INSTRUCTIONS" \
    | json_pp
}

retrieve_pickup() {
    # ep retrieve_pickup: Retrieve a single pickup
    printf "%s\n" "Enter a pickup ID: "
    read -r PICKUP
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/pickups/"$PICKUP" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

create_payment_log_report() {
    # ep create_payment_log_report: Create a payment log report
    # Prompt user for input
    printf "%s\n" "Enter a start date (eg: 2016-10-01): "
    read -r STARTDATE
    printf "%s\n" "Enter an end date (eg: 2016-10-31): "
    read -r ENDDATE

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/reports/payment_log \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}

create_refund_report() {
    # ep create_refund_report: Create a payment log report
    # Prompt user for input
    printf "%s\n" "Enter a start date (eg: 2016-10-01): "
    read -r STARTDATE
    printf "%s\n" "Enter an end date (eg: 2016-10-31): "
    read -r ENDDATE

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/reports/refund \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}

create_shipment_report() {
    # ep create_shipment_report: Create a payment log report
    # Prompt user for input
    printf "%s\n" "Enter a start date (eg: 2016-10-01): "
    read -r STARTDATE
    printf "%s\n" "Enter an end date (eg: 2016-10-31): "
    read -r ENDDATE

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/reports/shipment \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}

create_shipment_invoice_report() {
    # ep create_shipment_invoice_report: Create a shipment invoice report
    # Prompt user for input
    printf "%s\n" "Enter a start date (eg: 2016-10-01): "
    read -r STARTDATE
    printf "%s\n" "Enter an end date (eg: 2016-10-31): "
    read -r ENDDATE

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/reports/shipment_invoice \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}

create_tracker_report() {
    # ep create_tracker_report: Create a payment log report
    # Prompt user for input
    printf "%s\n" "Enter a start date (eg: 2016-10-01): "
    read -r STARTDATE
    printf "%s\n" "Enter an end date (eg: 2016-10-31): "
    read -r ENDDATE

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/reports/tracker \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}

retrieve_payment_log_report() {
    # ep retrieve_payment_log_report: Retrieve a single payment log report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/payment_log/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_refund_report() {
    # ep retrieve_refund_report: Retrieve a single refund report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/refund/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipment_report() {
    # ep retrieve_shipment_report: Retrieve a single shipment report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/shipment/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipment_invoice_report() {
    # ep retrieve_shipment_invoice_report: Retrieve a single shipment invoice report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/shipment_invoice/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_tracker_report() {
    # ep retrieve_tracker_report: Retrieve a single tracker report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/tracker/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_payment_log_reports() {
    # ep retrieve_payment_log_reports: Retrieve a list of payment log reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/payment_log \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_refund_reports() {
    # ep retrieve_refund_reports: Retrieve a list of refund reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/refund \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipment_reports() {
    # ep retrieve_shipment_reports: Retrieve a list of shipment reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/shipment \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipment_invoice_reports() {
    # ep retrieve_shipment_invoice_reports: Retrieve a list of shipment invoice reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/shipment_invoice \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_tracker_reports() {
    # ep retrieve_tracker_reports: Retrieve a list of tracker reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/tracker \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

manifest_batch() {
    # ep manifest_batch: Manifest or scanform a batch
    printf "%s\n" "Enter a batch ID you'd like to manifest: "
    read -r BATCH
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/scan_form \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_scanform() {
    # ep retrieve_scanform: Retrieve a single scanform
    printf "%s\n" "Enter a scanform ID: "
    read -r SCANFORM
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/scan_forms/"$SCANFORM" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_scanforms() {
    # ep retrieve_scanforms: Retrieve a list of scanforms

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/scan_forms \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

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

    # Set hardcoded variables
    STAMP_US_COUNTRY="US"
    STAMP_WEIGHT="1"
    STAMP_PREDEFINED_PACKAGE="Letter"
    STAMP_SERVICE="First"
    STAMP_USPS_STRING="USPS"

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipment[to_address][street1]=$TO_STREET1" \
    -d "shipment[to_address][street2]=$TO_STREET2" \
    -d "shipment[to_address][city]=$TO_CITY" \
    -d "shipment[to_address][state]=$TO_STATE" \
    -d "shipment[to_address][zip]=$TO_ZIP" \
    -d "shipment[to_address][country]=$STAMP_US_COUNTRY" \
    -d "shipment[to_address][name]=$TO_NAME" \
    -d "shipment[to_address][company]=$TO_COMPANY" \
    -d "shipment[to_address][phone]=$TO_PHONE" \
    -d "shipment[to_address][email]=$TO_EMAIL" \
    -d "shipment[from_address][street1]=$FROM_STREET1" \
    -d "shipment[from_address][street2]=$FROM_STREET2" \
    -d "shipment[from_address][city]=$FROM_CITY" \
    -d "shipment[from_address][state]=$FROM_STATE" \
    -d "shipment[from_address][zip]=$FROM_ZIP" \
    -d "shipment[from_address][country]=$STAMP_US_COUNTRY" \
    -d "shipment[from_address][name]=$FROM_NAME" \
    -d "shipment[from_address][company]=$FROM_COMPANY" \
    -d "shipment[from_address][phone]=$FROM_PHONE" \
    -d "shipment[from_address][email]=$FROM_EMAIL" \
    -d "shipment[parcel][weight]=$STAMP_WEIGHT" \
    -d "shipment[parcel][predefined_package]=$STAMP_PREDEFINED_PACKAGE" \
    -d "shipment[service]=$STAMP_SERVICE" \
    -d "shipment[carrier]=$STAMP_USPS_STRING" \
    -d "shipment[carrier_accounts][]=$USPS_CARRIER_ACCOUNT_ID" \
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

    # Set hardcoded variables
    RETURN_BOOLEAN="true"

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "shipment[to_address][id]=$TO_ADDRESS" \
    -d "shipment[from_address][id]=$FROM_ADDRESS" \
    -d "shipment[parcel][id]=$PARCEL" \
    -d "shipment[is_return]=$RETURN_BOOLEAN" \
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

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/shipments \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_smartrates() {
    # ep retrieve_smartrates: Retrieve a shipment's smartrates
    # Prompt user for input
    printf "%s\n" "Enter shipment ID: "
    read -r SHIPMENT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/shipments/"$SHIPMENT"/smartrate \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

create_tracker() {
    # ep create_tracker: Create a tracker for a shipment
    # Prompt user for input
    printf "%s\n" "Enter tracking code: "
    read -r TRACKER
    printf "%s\n" "Enter carrier (optional): "
    read -r CARRIER

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/trackers \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "tracker[tracking_code]=$TRACKER" \
    -d "tracker[carrier]=$CARRIER" \
    | json_pp
}

retrieve_tracker() {
    # ep retrieve_tracker: Retrieve a tracker record
    # Prompt user for input
    printf "%s\n" "Enter tracker ID: "
    read -r TRACKER

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/trackers/"$TRACKER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_trackers() {
    # ep retrieve_trackers: Retrieve a list of trackers

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/trackers \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

create_child_user() {
    # ep create_child_user: Create a child user (requires production API key)
    # Prompt user for input
    printf "%s\n" "Enter child user name: "
    read -r USER
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/users \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "user[name]=$USER" \
    | json_pp
}

retrieve_api_keys() {
    # ep retrieve_api_keys: Retrieve the API keys of the associated account
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/api_keys \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_carrier_account() {
    # ep retrieve_carrier_account: Retrieve a single configured carrier account
    # Prompt user for input
    printf "%s\n" "Enter carrier account ID: "
    read -r CARRIER

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/carrier_accounts/"$CARRIER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_carrier_accounts() {
    # ep retrieve_carrier_accounts: Retrieve the list of configured carrier accounts
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/carrier_accounts \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_carrier_types() {
    # ep retrieve_carrier_types: Retrieve the list of all carrier types available to the account of the given API key.
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/carrier_types \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_user() {
    # ep retrieve_user: Retrieve the users of the associated account
    # Prompt user for input
    printf "%s\n" "Enter user ID: "
    read -r USER
    
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/users/"$USER" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_users() {
    # ep retrieve_users: Retrieve the users of the associated account
    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/users \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

version() {
    # ep version: Show the EasyPost CLI version info
    printf "%s\n" "EasyPost CLI - $EASYPOST_CLI_VERSION"
}

create_webhook() {
    # ep create_webhooks: Create a webhook
    # Prompt user for input
    printf "%s\n" "Enter the webhook URL: "
    read -r WEBHOOK

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/webhooks \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "webhook[url]=$WEBHOOK" \
    | json_pp
}

delete_webhook() {
    # ep delete_webhook: Enables a Webhook that has been disabled.
    # Prompt user for input
    printf "%s\n" "Enter a webhook ID: "
    read -r WEBHOOK

    # Build curl request
    curl -s -X DELETE "$EASYPOST_API_URL"/webhooks/"$WEBHOOK" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_webhook() {
    # ep retrieve_webhook: Retrieve a list of webhooks
    # Prompt user for input
    printf "%s\n" "Enter a webhook ID: "
    read -r WEBHOOK

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/webhooks/"$WEBHOOK" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_webhooks() {
    # ep retrieve_webhooks: Retrieve a list of webhooks

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/webhooks \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

update_webhook() {
    # ep update_webhook: Enables a Webhook that has been disabled.
    # Prompt user for input
    printf "%s\n" "Enter a webhook ID: "
    read -r WEBHOOK

    # Build curl request
    curl -s -X PUT "$EASYPOST_API_URL"/webhooks/"$WEBHOOK" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

main "$1"

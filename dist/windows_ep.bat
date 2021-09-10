:::::::::::::::::::::::::::::::::::::::::::::::
:: EASYPOST CLI
:: https://github.com/Justintime50/easypost-cli
:: Author: Justintime50
:::::::::::::::::::::::::::::::::::::::::::::::

:: Init Functions

:main
    :: Run this main function anytime the CLI is used
    @echo off
    set EASYPOST_API_URL="https://api.easypost.com/v2"
    set EASYPOST_CLI_VERSION="1.5.0"

    call :check_config_file
    call :check_api_key
    call :check_api_url
    call :command_router %1
exit /b 0

:check_config_file
    :: Check that the config file is available
    call C:/easypost-cli/easypost-cli-config.bat 2>null || (echo C:/easypost-cli/easypost-cli-config.bat not found, please ensure this file exists before using the easypost-cli. & exit /b 1)
exit /b 0

:check_api_key
    :: Check that the API key is set
    if not defined EASYPOST_CLI_API_KEY (
        echo The EasyPost CLI is misconfigured, please ensure your API key is set and accessible via this shell.
        exit /b 1
    )
exit /b 0

:check_api_url
    :: Check that the API URL is set
    if not defined EASYPOST_API_URL (
        echo The EasyPost API URL is not set. API calls cannot be sent without this variable.
        exit /b 1
    )
exit /b 0

:command_router
    :: Check if the command passed is valid or not. 
    :: Run if it is a valid command, warn and exit if it is not.
    call :%1 2>null || (echo "%1" is not an EasyPost CLI command, please try again. & exit /b 1)
exit /b 0

:: Endpoint Functions

:create_address
    :: ep create_address: Create an address record
    :: Prompt user for input
    echo Enter street1: 
    set /P STREET1=
    echo Enter street2 (optional): 
    set /P STREET2=
    echo Enter city: 
    set /P CITY=
    echo Enter state: 
    set /P STATE=
    echo Enter zip: 
    set /P ZIP=
    echo Enter country (optional): 
    set /P COUNTRY=
    echo Enter name (optional): 
    set /P NAME=
    echo Enter company (optional): 
    set /P COMPANY=
    echo Enter phone (optional): 
    set /P PHONE=
    echo Enter email (optional): 
    set /P EMAIL=

    :: Build Curl Request
    curl -s -X POST %EASYPOST_API_URL%/addresses ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "address[street1]=%STREET1%" ^
    -d "address[street2]=%STREET2%" ^
    -d "address[city]=%CITY%" ^
    -d "address[state]=%STATE%" ^
    -d "address[zip]=%ZIP%" ^
    -d "address[country]=%COUNTRY%" ^
    -d "address[name]=%NAME%" ^
    -d "address[company]=%COMPANY%" ^
    -d "address[phone]=%PHONE%" ^
    -d "address[email]=%EMAIL%" ^
    | jq .
exit /b 0

:retrieve_address
    :: ep retrieve_address: Retrieve an address record
    :: Prompt user for input
    echo Enter address ID: 
    set /P ADDRESS=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/addresses/%ADDRESS% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_addresses
    :: ep retrieve_addresses: Retrieve a list of addresses

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/addresses ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:add_shipment_to_batch
    :: ep add_shipment_to_batch: Add a shipment to a batch
    :: Prompt user for input
    echo Enter a batch ID to add shipments to: 
    set /P BATCH=
    echo Enter a shipment ID to add to the batch: 
    set /P SHIPMENT=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/batches/%BATCH%/add_shipments ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "shipments[0][id]=%SHIPMENT%" ^
    | jq .
exit /b 0

:create_batch
    :: ep create_batch: Create an empty batch object
    
    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/batches ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:generate_batch_label
    :: ep generate_batch_label: Generate a label for a batch of shipments
    :: Prompt user for input
    FORMAT="null"
    echo Enter a batch ID to generate a label for: 
    set /P BATCH=

    :: Allow the user to choose
    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/batches/%BATCH%/label ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "label_format=%FORMAT%" ^
    | jq .
exit /b 0

:remove_shipment_from_batch
    :: ep remove_shipment_from_batch: Remove a shipment from a batch
    :: Prompt user for input
    echo Enter a batch ID to remove shipments from: 
    set /P BATCH=
    echo Enter a shipment ID to remove from the batch: 
    set /P SHIPMENT=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/batches/%BATCH%/remove_shipments ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "shipments[0][id]=%SHIPMENT%" ^
    | jq .
exit /b 0

:help
    :: ep help: Show the docs
    start https://github.com/Justintime50/easypost-cli/blob/master/docs/man.md
exit /b 0

:create_insurance
    :: ep create_insurance: Create an insurance record for shipments not from EasyPost
    :: Prompt user for input
    echo Enter to address ID: 
    set /P TO_ADDRESS=
    echo Enter from address ID: 
    set /P FROM_ADDRESS=
    echo Enter tracking code from the carrier: 
    set /P TRACKING=
    echo Enter carrier (optional, recommended): 
    set /P CARRIER=
    echo Enter external reference ID (optional): 
    set /P REFERENCE=
    echo Enter amount to insure: 
    set /P AMOUNT=

    :: Build Curl Request
    curl -s -X POST %EASYPOST_API_URL%/insurances ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "insurance[to_address][id]=%TO_ADDRESS%" ^
    -d "insurance[from_address][id]=%FROM_ADDRESS%" ^
    -d "insurance[tracking_code]=%TRACKING%" ^
    -d "insurance[carrier]=%CARRIER%" ^
    -d "insurance[reference]=%REFERENCE%" ^
    -d "insurance[amount]=%AMOUNT%" ^
    | jq .
exit /b 0

:retrieve_insurance
    :: ep retrieve_insurance: Retrieve an insurnace record
    :: Prompt user for input
    echo Enter insurance ID: 
    set /P INSURANCE=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/insurances/%INSURANCE% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_insurances
    :: ep retrieve_insurances: Retrieve a list of insurances

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/insurances ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_order
    :: ep retrieve_order: Retrieve a order record
    :: Prompt user for input
    echo Enter order ID: 
    set /P ORDER=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/orders/%ORDER% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:create_parcel
    :: ep create_parcel: Create a parcel record
    :: Prompt user for input
    echo Enter parcel length (in inches): 
    set /P LENGTH=
    echo Enter parcel width (in inches): 
    set /P WIDTH=
    echo Enter parcel height (in inches): 
    set /P HEIGHT=
    echo Enter parcel weight (in ounces): 
    set /P WEIGHT=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/parcels ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "parcel[length]=%LENGTH%" ^
    -d "parcel[width]=%WIDTH%" ^
    -d "parcel[height]=%HEIGHT%" ^
    -d "parcel[weight]=%WEIGHT%" ^
    | jq .
exit /b 0

:retrieve_parcel
    :: ep retrieve_parcel: Retrieve a parcel record
    :: Prompt user for input
    echo Enter parcel ID: 
    set /P PARCEL=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/parcels/%PARCEL% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:buy_pickup
    :: ep buy_pickup: Buy a pickup
    echo Enter a pickup ID: 
    set /P PICKUP=
    echo Enter a carrier code (eg: "UPS"): 
    set /P CARRIER=
    echo Enter a service level (eg: "Same-Day Pickup"): 
    set /P SERVICE=
    
    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/pickups/%PICKUP%/buy ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "carrier=%CARRIER%" ^
    -d "service=%SERVICE%" ^
    | jq .
exit /b 0

:cancel_pickup
    :: ep cancel_pickup: Cancel a pickup
    echo Enter a pickup ID: 
    set /P PICKUP=
    
    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/pickups/%PICKUP%/cancel ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:create_pickup
    :: ep create_pickup: Create a pickup
    echo Enter a shipment ID for the pickup: 
    set /P SHIPMENT=
    echo Enter an address ID for the pickup: 
    set /P ADDRESS=
    echo Enter a minimum time for the pickup (eg: 2019-10-20 17:10:00): 
    set /P MINTIME=
    echo Enter a maximum time for the pickup (eg: 2019-10-21 10:30:00): 
    set /P MAXTIME=
    echo Enter any special instructions (eg: "Knock loudly" - optional): 
    set /P INSTRUCTIONS=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/pickups ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "pickup[min_datetime]=%MINTIME%" ^
    -d "pickup[max_datetime]=%MAXTIME%" ^
    -d "pickup[shipment][id]=%SHIPMENT%" ^
    -d "pickup[address][id]=%ADDRESS%" ^
    -d "pickup[instructions]=%INSTRUCTIONS%" ^
    | jq .
exit /b 0

:retrieve_pickup
    :: ep retrieve_pickup: Retrieve a single pickup
    echo Enter a pickup ID: 
    set /P PICKUP=
    
    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/pickups/%PICKUP% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:create_payment_log_report
    :: ep create_payment_log_report: Create a payment log report
    :: Prompt user for input
    echo Enter a start date (eg: 2016-10-01): 
    set /P STARTDATE=
    echo Enter an end date (eg: 2016-10-31): 
    set /P ENDDATE=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/reports/payment_log ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "{'start_date':%STARTDATE%,'end_date':%ENDDATE%}" ^
    | jq .
exit /b 0

:create_refund_report
    :: ep create_refund_report: Create a payment log report
    :: Prompt user for input
    echo Enter a start date (eg: 2016-10-01): 
    set /P STARTDATE=
    echo Enter an end date (eg: 2016-10-31): 
    set /P ENDDATE=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/reports/refund ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "{'start_date':%STARTDATE%,'end_date':%ENDDATE%}" ^
    | jq .
exit /b 0

:create_shipment_report
    :: ep create_shipment_report: Create a payment log report
    :: Prompt user for input
    echo Enter a start date (eg: 2016-10-01): 
    set /P STARTDATE=
    echo Enter an end date (eg: 2016-10-31): 
    set /P ENDDATE=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/reports/shipment ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "{'start_date':%STARTDATE%,'end_date':%ENDDATE%}" ^
    | jq .
exit /b 0

:create_shipment_invoice_report
    :: ep create_shipment_invoice_report: Create a shipment invoice report
    :: Prompt user for input
    echo Enter a start date (eg: 2016-10-01): 
    set /P STARTDATE=
    echo Enter an end date (eg: 2016-10-31): 
    set /P ENDDATE=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/reports/shipment_invoice ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "{'start_date':%STARTDATE%,'end_date':%ENDDATE%}" ^
    | jq .
exit /b 0

:create_tracker_report
    :: ep create_tracker_report: Create a payment log report
    :: Prompt user for input
    echo Enter a start date (eg: 2016-10-01): 
    set /P STARTDATE=
    echo Enter an end date (eg: 2016-10-31): 
    set /P ENDDATE=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/reports/tracker ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "{'start_date':%STARTDATE%,'end_date':%ENDDATE%}" ^
    | jq .
exit /b 0

:retrieve_payment_log_report
    :: ep retrieve_payment_log_report: Retrieve a single payment log report
    :: Prompt user for input
    echo Enter report ID: 
    set /P REPORT=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/payment_log/%REPORT% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_refund_report
    :: ep retrieve_refund_report: Retrieve a single refund report
    :: Prompt user for input
    echo Enter report ID: 
    set /P REPORT=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/refund/%REPORT% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_shipment_report
    :: ep retrieve_shipment_report: Retrieve a single shipment report
    :: Prompt user for input
    echo Enter report ID: 
    set /P REPORT=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/shipment/%REPORT% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_shipment_invoice_report
    :: ep retrieve_shipment_invoice_report: Retrieve a single shipment invoice report
    :: Prompt user for input
    echo Enter report ID: 
    set /P REPORT=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/shipment_invoice/%REPORT% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_tracker_report
    :: ep retrieve_tracker_report: Retrieve a single tracker report
    :: Prompt user for input
    echo Enter report ID: 
    set /P REPORT=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/tracker/%REPORT% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_payment_log_reports
    :: ep retrieve_payment_log_reports: Retrieve a list of payment log reports

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/payment_log ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_refund_reports
    :: ep retrieve_refund_reports: Retrieve a list of refund reports

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/refund ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_shipment_reports
    :: ep retrieve_shipment_reports: Retrieve a list of shipment reports

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/shipment ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_shipment_invoice_reports
    :: ep retrieve_shipment_invoice_reports: Retrieve a list of shipment invoice reports

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/shipment_invoice ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_tracker_reports
    :: ep retrieve_tracker_reports: Retrieve a list of tracker reports

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/reports/tracker ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:manifest_batch
    :: ep manifest_batch: Manifest or scanform a batch
    echo Enter a batch ID you'd like to manifest: 
    set /P BATCH=
    
    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/batches/%BATCH%/scan_form ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_scanform
    :: ep retrieve_scanform: Retrieve a single scanform
    echo Enter a scanform ID: 
    set /P SCANFORM=
    
    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/scan_forms/%SCANFORM% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_scanforms
    :: ep retrieve_scanforms: Retrieve a list of scanforms

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/scan_forms ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:buy_shipment
    :: ep buy_shipment: Buy a label for the specified shipment
    :: Prompt user for input
    echo Enter shipment ID: 
    set /P SHIPMENT=
    echo Enter rate ID: 
    set /P RATE=
    echo Enter insurance amount (optional): 
    set /P INSURANCE=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/shipments/%SHIPMENT%/buy ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "rate[id]=%RATE%" ^
    -d "insurance=%INSURANCE%" ^
    | jq .
exit /b 0

:buy_stamp
    :: ep buy_stamp: Purchases a single USPS domestic stamp and creates a ::10 letter size label to print onto a standard envelope
    :: Prompt user for input
    echo Enter to_street1: 
    set /P TO_STREET1=
    echo Enter to_street2 (optional): 
    set /P TO_STREET2=
    echo Enter to_city: 
    set /P TO_CITY=
    echo Enter to_state: 
    set /P TO_STATE=
    echo Enter to_zip: 
    set /P TO_ZIP=
    echo Enter to_name (optional): 
    set /P TO_NAME=
    echo Enter to_company (optional): 
    set /P TO_COMPANY=
    echo Enter to_phone (optional): 
    set /P TO_PHONE=
    echo Enter to_email (optional): 
    set /P TO_EMAIL=

    echo Enter from_street1: 
    set /P FROM_STREET1=
    echo Enter from_street2 (optional): 
    set /P FROM_STREET2=
    echo Enter from_city: 
    set /P FROM_CITY=
    echo Enter from_state: 
    set /P FROM_STATE=
    echo Enter from_zip: 
    set /P FROM_ZIP=
    echo Enter from_name (optional): 
    set /P FROM_NAME=
    echo Enter from_company (optional): 
    set /P FROM_COMPANY=
    echo Enter from_phone (optional): 
    set /P FROM_PHONE=
    echo Enter from_email (optional): 
    set /P FROM_EMAIL=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/shipments ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "shipment[to_address][street1]=%TO_STREET1%" ^
    -d "shipment[to_address][street2]=%TO_STREET2%" ^
    -d "shipment[to_address][city]=%TO_CITY%" ^
    -d "shipment[to_address][state]=%TO_STATE%" ^
    -d "shipment[to_address][zip]=%TO_ZIP%" ^
    -d "shipment[to_address][country]=US%" ^
    -d "shipment[to_address][name]=%TO_NAME%" ^
    -d "shipment[to_address][company]=%TO_COMPANY%" ^
    -d "shipment[to_address][phone]=%TO_PHONE%" ^
    -d "shipment[to_address][email]=%TO_EMAIL%" ^
    -d "shipment[from_address][street1]=%FROM_STREET1%" ^
    -d "shipment[from_address][street2]=%FROM_STREET2%" ^
    -d "shipment[from_address][city]=%FROM_CITY%" ^
    -d "shipment[from_address][state]=%FROM_STATE%" ^
    -d "shipment[from_address][zip]=%FROM_ZIP%" ^
    -d "shipment[from_address][country]=US%" ^
    -d "shipment[from_address][name]=%FROM_NAME%" ^
    -d "shipment[from_address][company]=%FROM_COMPANY%" ^
    -d "shipment[from_address][phone]=%FROM_PHONE%" ^
    -d "shipment[from_address][email]=%FROM_EMAIL%" ^
    -d "shipment[parcel][weight]=1%" ^
    -d "shipment[parcel][predefined_package]=Letter%" ^
    -d "shipment[service]=First%" ^
    -d "shipment[carrier]=USPS%" ^
    -d "shipment[carrier_accounts][]=%USPS_CARRIER_ACCOUNT_ID%" ^
    | jq .
exit /b 0

:create_return
    :: ep create_return: Create a return shipment that swaps the to and from addresses on the label (requires address and parcel IDs)
    :: Prompt user for input
    echo Enter a to_address ID: 
    set /P TO_ADDRESS=
    echo Enter a from_address ID: 
    set /P FROM_ADDRESS=
    echo Enter a parcel ID: 
    set /P PARCEL=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/shipments ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "shipment[to_address][id]=%TO_ADDRESS%" ^
    -d "shipment[from_address][id]=%FROM_ADDRESS%" ^
    -d "shipment[parcel][id]=%PARCEL%" ^
    -d "shipment[is_return]=true%" ^
    | jq .
exit /b 0

:create_shipment
    :: ep create_shipment: Create a shipment record that can then be used to purchase a label
    :: Prompt user for input
    echo Enter to_street1: 
    set /P TO_STREET1=
    echo Enter to_street2 (optional): 
    set /P TO_STREET2=
    echo Enter to_city: 
    set /P TO_CITY=
    echo Enter to_state: 
    set /P TO_STATE=
    echo Enter to_zip: 
    set /P TO_ZIP=
    echo Enter to_country (optional): 
    set /P TO_COUNTRY=
    echo Enter to_name (optional): 
    set /P TO_NAME=
    echo Enter to_company (optional): 
    set /P TO_COMPANY=
    echo Enter to_phone (optional): 
    set /P TO_PHONE=
    echo Enter to_email (optional): 
    set /P TO_EMAIL=

    echo Enter from_street1: 
    set /P FROM_STREET1=
    echo Enter from_street2 (optional): 
    set /P FROM_STREET2=
    echo Enter from_city: 
    set /P FROM_CITY=
    echo Enter from_state: 
    set /P FROM_STATE=
    echo Enter from_zip: 
    set /P FROM_ZIP=
    echo Enter from_country (optional): 
    set /P FROM_COUNTRY=
    echo Enter from_name (optional): 
    set /P FROM_NAME=
    echo Enter from_company (optional): 
    set /P FROM_COMPANY=
    echo Enter from_phone (optional): 
    set /P FROM_PHONE=
    echo Enter from_email (optional): 
    set /P FROM_EMAIL=

    echo Enter parcel length: 
    set /P LENGTH=
    echo Enter parcel width: 
    set /P WIDTH=
    echo Enter parcel height: 
    set /P HEIGHT=
    echo Enter parcel weight: 
    set /P WEIGHT=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/shipments ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "shipment[to_address][street1]=%TO_STREET1%" ^
    -d "shipment[to_address][street2]=%TO_STREET2%" ^
    -d "shipment[to_address][city]=%TO_CITY%" ^
    -d "shipment[to_address][state]=%TO_STATE%" ^
    -d "shipment[to_address][zip]=%TO_ZIP%" ^
    -d "shipment[to_address][country]=%TO_COUNTRY%" ^
    -d "shipment[to_address][name]=%TO_NAME%" ^
    -d "shipment[to_address][company]=%TO_COMPANY%" ^
    -d "shipment[to_address][phone]=%TO_PHONE%" ^
    -d "shipment[to_address][email]=%TO_EMAIL%" ^
    -d "shipment[from_address][street1]=%FROM_STREET1%" ^
    -d "shipment[from_address][street2]=%FROM_STREET2%" ^
    -d "shipment[from_address][city]=%FROM_CITY%" ^
    -d "shipment[from_address][state]=%FROM_STATE%" ^
    -d "shipment[from_address][zip]=%FROM_ZIP%" ^
    -d "shipment[from_address][country]=%FROM_COUNTRY%" ^
    -d "shipment[from_address][name]=%FROM_NAME%" ^
    -d "shipment[from_address][company]=%FROM_COMPANY%" ^
    -d "shipment[from_address][phone]=%FROM_PHONE%" ^
    -d "shipment[from_address][email]=%FROM_EMAIL%" ^
    -d "shipment[parcel][length]=%LENGTH%" ^
    -d "shipment[parcel][width]=%WIDTH%" ^
    -d "shipment[parcel][height]=%HEIGHT%" ^
    -d "shipment[parcel][weight]=%WEIGHT%" ^
    | jq .
exit /b 0

:refund_shipment
    :: ep refund_shipment: Refund a specified shipment
    :: Prompt user for input
    echo Enter shipment ID: 
    set /P SHIPMENT=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/shipments/%SHIPMENT%/refund ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:regenerate_rates
    :: ep regenerate_rates: Regenerate rates for a shipment
    :: Prompt user for input
    echo Enter shipment ID: 
    set /P SHIPMENT=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/shipments/%SHIPMENT%/rates ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_shipment
    :: ep retrieve_shipment: Retrieve a shipment record
    :: Prompt user for input
    echo Enter shipment ID: 
    set /P SHIPMENT=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/shipments/%SHIPMENT% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_shipments
    :: ep retrieve_shipments: Retrieve a list of shipments

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/shipments ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_smartrates
    :: ep retrieve_smartrates: Retrieve a shipment's smartrates
    :: Prompt user for input
    echo Enter shipment ID: 
    set /P SHIPMENT=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/shipments/%SHIPMENT%/smartrate ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:create_tracker
    :: ep create_tracker: Create a tracker for a shipment
    :: Prompt user for input
    echo Enter tracking code: 
    set /P TRACKER=
    echo Enter carrier (optional): 
    set /P CARRIER=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/trackers ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "tracker[tracking_code]=%TRACKER%" ^
    -d "tracker[carrier]=%CARRIER%" ^
    | jq .
exit /b 0

:retrieve_tracker
    :: ep retrieve_tracker: Retrieve a tracker record
    :: Prompt user for input
    echo Enter tracker ID: 
    set /P TRACKER=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/trackers/%TRACKER% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_trackers
    :: ep retrieve_trackers: Retrieve a list of trackers

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/trackers ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:create_child_user
    :: ep create_child_user: Create a child user (requires production API key)
    :: Prompt user for input
    echo Enter child user name: 
    set /P USER=
    
    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/users ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "user[name]=%USER%" ^
    | jq .
exit /b 0

:retrieve_api_keys
    :: ep retrieve_api_keys: Retrieve the API keys of the associated account
    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/api_keys ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_carrier_account
    :: ep retrieve_carrier_account: Retrieve a single configured carrier account
    :: Prompt user for input
    echo Enter carrier account ID: 
    set /P CARRIER=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/carrier_accounts/%CARRIER% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_carrier_accounts
    :: ep retrieve_carrier_accounts: Retrieve the list of configured carrier accounts
    
    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/carrier_accounts ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_carrier_types
    :: ep retrieve_carrier_types: Retrieve the list of all carrier types available to the account of the given API key.
    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/carrier_types ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_user
    :: ep retrieve_user: Retrieve the users of the associated account
    :: Prompt user for input
    echo Enter user ID: 
    set /P USER=
    
    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/users/%USER% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_users
    :: ep retrieve_users: Retrieve the users of the associated account
    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/users ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:version
    :: ep version: Show the EasyPost CLI version info
    echo EasyPost CLI - %EASYPOST_CLI_VERSION"
exit /b 0

:create_webhook
    :: ep create_webhooks: Create a webhook
    :: Prompt user for input
    echo Enter the webhook URL: 
    set /P WEBHOOK=

    :: Build curl request
    curl -s -X POST %EASYPOST_API_URL%/webhooks ^
    -u %EASYPOST_CLI_API_KEY%: ^
    -d "webhook[url]=%WEBHOOK%" ^
    | jq .
exit /b 0

:delete_webhook
    :: ep delete_webhook: Enables a Webhook that has been disabled.
    :: Prompt user for input
    echo Enter a webhook ID: 
    set /P WEBHOOK=

    :: Build curl request
    curl -s -X DELETE %EASYPOST_API_URL%/webhooks/%WEBHOOK% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_webhook
    :: ep retrieve_webhook: Retrieve a list of webhooks
    :: Prompt user for input
    echo Enter a webhook ID: 
    set /P WEBHOOK=

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/webhooks/%WEBHOOK% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:retrieve_webhooks
    :: ep retrieve_webhooks: Retrieve a list of webhooks

    :: Build curl request
    curl -s -X GET %EASYPOST_API_URL%/webhooks ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

:update_webhook
    :: ep update_webhook: Enables a Webhook that has been disabled.
    :: Prompt user for input
    echo Enter a webhook ID: 
    set /P WEBHOOK=

    :: Build curl request
    curl -s -X PUT %EASYPOST_API_URL%/webhooks/%WEBHOOK% ^
    -u %EASYPOST_CLI_API_KEY%: ^
    | jq .
exit /b 0

main %1

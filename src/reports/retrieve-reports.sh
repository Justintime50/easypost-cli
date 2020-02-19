
function retrieve-payment-log-reports {
    # ep retrieve-payment-log-reports: Retrieve a list of payment log reports

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/payment_log \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp 
}

function retrieve-refund-reports {
    # ep retrieve-refund-reports: Retrieve a list of payment log reports

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/refund \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp 
}

function retrieve-shipment-reports {
    # ep retrieve-shipment-reports: Retrieve a list of payment log reports

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/shipment \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp 
}

function retrieve-tracker-reports {
    # ep retrieve-tracker-reports: Retrieve a list of payment log reports

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/tracker \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp 
}

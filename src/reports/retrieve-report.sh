
function retrieve-payment-log-report {
    # ep retrieve-payment-log-report: Retrieve a single payment log report
    # Prompt user for input
    echo "Enter report ID:"
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/report/payment_log/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

function retrieve-refund-report {
    # ep retrieve-refund-report: Retrieve a single payment log report
    # Prompt user for input
    echo "Enter report ID:"
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/report/refund/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

function retrieve-shipment-report {
    # ep retrieve-shipment-report: Retrieve a single payment log report
    # Prompt user for input
    echo "Enter report ID:"
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/report/shipment/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

function retrieve-tracker-report {
    # ep retrieve-tracker-report: Retrieve a single payment log report
    # Prompt user for input
    echo "Enter report ID:"
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/report/tracker/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

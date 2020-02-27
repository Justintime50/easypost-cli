
retrieve_payment_log_report() {
    # ep retrieve_payment_log_report: Retrieve a single payment log report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/report/payment_log/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_refund_report() {
    # ep retrieve_refund_report: Retrieve a single payment log report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/report/refund/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipment_report() {
    # ep retrieve_shipment_report: Retrieve a single payment log report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/report/shipment/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_tracker_report() {
    # ep retrieve_tracker_report: Retrieve a single payment log report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/report/tracker/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

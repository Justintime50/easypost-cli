
retrieve_payment_log_reports() {
    # ep retrieve_payment_log_reports: Retrieve a list of payment log reports

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/payment_log \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_refund_reports() {
    # ep retrieve_refund_reports: Retrieve a list of payment log reports

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/refund \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipment_reports() {
    # ep retrieve_shipment_reports: Retrieve a list of payment log reports

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/shipment \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_tracker_reports() {
    # ep retrieve_tracker_reports: Retrieve a list of payment log reports

    # TODO: Add date and page_size options

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/tracker \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}


create_report() {
    # ep create_report: Create a report
    # Prompt user for input
    printf "%s\n" "Type of report (eg: cash_flow, payment_log, refund, shipment, shipment_invoice, tracker): "
    read -r REPORT_TYPE
    printf "%s\n" "Enter a start date (eg: 2016-10-01): "
    read -r STARTDATE
    printf "%s\n" "Enter an end date (eg: 2016-10-31): "
    read -r ENDDATE

    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/reports/"$REPORT_TYPE" \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}

create_payment_log_report() {
    # DEPRECATED, use `create_report` instead
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
    # DEPRECATED, use `create_report` instead
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
    # DEPRECATED, use `create_report` instead
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
    # DEPRECATED, use `create_report` instead
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
    # DEPRECATED, use `create_report` instead
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

retrieve_reports() {
    # ep retrieve_reports: Retrieve a list of reports
    # Prompt user for input
    printf "%s\n" "Type of reports (eg: cash_flow, payment_log, refund, shipment, shipment_invoice, tracker): "
    read -r REPORT_TYPE

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/"$REPORT_TYPE" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_payment_log_reports() {
    # DEPRECATED, use `retrieve_reports` instead
    # ep retrieve_payment_log_reports: Retrieve a list of payment log reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/payment_log \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_refund_reports() {
    # DEPRECATED, use `retrieve_reports` instead
    # ep retrieve_refund_reports: Retrieve a list of refund reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/refund \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipment_reports() {
    # DEPRECATED, use `retrieve_reports` instead
    # ep retrieve_shipment_reports: Retrieve a list of shipment reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/shipment \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_shipment_invoice_reports() {
    # DEPRECATED, use `retrieve_reports` instead
    # ep retrieve_shipment_invoice_reports: Retrieve a list of shipment invoice reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/shipment_invoice \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_tracker_reports() {
    # DEPRECATED, use `retrieve_reports` instead
    # ep retrieve_tracker_reports: Retrieve a list of tracker reports

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/tracker \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_report() {
    # ep retrieve_payment: Retrieve a report
    # Prompt user for input
    printf "%s\n" "Type of report (eg: cash_flow, payment_log, refund, shipment, shipment_invoice, tracker): "
    read -r REPORT_TYPE
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/"$REPORT_TYPE"/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

retrieve_payment_log_report() {
    # DEPRECATED, use `retrieve_report` instead
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
    # DEPRECATED, use `retrieve_report` instead
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
    # DEPRECATED, use `retrieve_report` instead
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
    # DEPRECATED, use `retrieve_report` instead
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
    # DEPRECATED, use `retrieve_report` instead
    # ep retrieve_tracker_report: Retrieve a single tracker report
    # Prompt user for input
    printf "%s\n" "Enter report ID: "
    read -r REPORT

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/tracker/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    | json_pp
}

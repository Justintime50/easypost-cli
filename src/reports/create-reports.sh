
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


create_payment_log_report() {
    # ep create_payment_log_report: Create a payment log report
    # Prompt user for input
    echo "Enter a start date (eg: 2016-10-01):"
    read -r STARTDATE
    echo "Enter an end date (eg: 2016-10-31):"
    read -r ENDDATE

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/payment_log/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}

create_refund_report() {
    # ep create_refund_report: Create a payment log report
    # Prompt user for input
    echo "Enter a start date (eg: 2016-10-01):"
    read -r STARTDATE
    echo "Enter an end date (eg: 2016-10-31):"
    read -r ENDDATE

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/refund/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}

create_shipment_report() {
    # ep create_shipment_report: Create a payment log report
    # Prompt user for input
    echo "Enter a start date (eg: 2016-10-01):"
    read -r STARTDATE
    echo "Enter an end date (eg: 2016-10-31):"
    read -r ENDDATE

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/shipment/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}

create_tracker_report() {
    # ep create_tracker_report: Create a payment log report
    # Prompt user for input
    echo "Enter a start date (eg: 2016-10-01):"
    read -r STARTDATE
    echo "Enter an end date (eg: 2016-10-31):"
    read -r ENDDATE

    # Build curl request
    curl -s -X GET "$EASYPOST_API_URL"/reports/tracker/"$REPORT" \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "{'start_date':$STARTDATE,'end_date':$ENDDATE}" \
    | json_pp
}


generate_batch_label() {
    # ep generate_batch_label: Generate a label for a batch of shipments
    # Prompt user for input
    FORMAT="null"
    echo "Enter a batch ID to generate a label for:"
    read -r BATCH
    while ! [ $FORMAT = "pdf" ] || [ $FORMAT = "PDF" ] || [ $FORMAT = "zpl" ] || [ $FORMAT = "ZPL" ] || [ $FORMAT = "epl2" ] || [ $FORMAT = "EPL2" ] ; do
        echo "Enter a label format (options: pdf, zpl, epl2):"
        read -r FORMAT
        if [ -z "$FORMAT" ] ; then
            echo "Format cannot be blank"
        fi
    done

    # Allow the user to choose
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/batches/"$BATCH"/label \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "label_format=$FORMAT" \
    | json_pp
}

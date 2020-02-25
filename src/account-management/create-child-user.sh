
create_child_user() {
    # ep create_child_user: Create a child user (requires production API key)
    # Prompt user for input
    echo "Enter child user name:"
    read -r USER
    
    # Build curl request
    curl -s -X POST "$EASYPOST_API_URL"/users \
    -u "$EASYPOST_CLI_API_KEY": \
    -d "user[name]=$USER" \
    | json_pp
}

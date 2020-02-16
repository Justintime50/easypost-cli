#!/bin/bash

echo "Installing EasyPost CLI..."
EASYPOST_CLI_LOCATION="/usr/local/bin"
if [[ -f "$EASYPOST_CLI_LOCATION"/ep ]] ; then
    rm -f "$EASYPOST_CLI_LOCATION"/ep
fi

# Download the EasyPost CLI
curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/src/ep $EASYPOST_CLI_LOCATION

# API Key setup
echo "Enter your EasyPost API key:"
read -r KEY
sed -i '' -e "s/EASYPOST_API_KEY=/EASYPOST_API_KEY=$KEY/g" "$EASYPOST_CLI_LOCATION"/ep
echo "EasyPost CLI installed!"

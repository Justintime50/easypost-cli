#!/bin/bash

echo "Installing EasyPost CLI..."
EASYPOST_CLI_LOCATION="/usr/local/bin"

# Remove the executable if it exists already
if [[ -f "$EASYPOST_CLI_LOCATION"/ep ]] ; then
    rm -f "$EASYPOST_CLI_LOCATION"/ep
fi

# Install the EasyPost CLI
curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/src/ep > "$EASYPOST_CLI_LOCATION"/ep
chmod +x "$EASYPOST_CLI_LOCATION"/ep

# API Key setup
echo "Enter your EasyPost API key:"
read -r KEY
sed -i '' -e "s/EASYPOST_API_KEY=/EASYPOST_API_KEY=$KEY/g" "$EASYPOST_CLI_LOCATION"/ep
echo "EasyPost CLI installed!"

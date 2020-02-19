#!/bin/bash

echo "Installing EasyPost CLI..."
EASYPOST_CLI_LOCATION="/usr/local/bin"
EASYPOST_CLI_HOME_LOCATION="$HOME/.easypost-cli"

# Remove the executable if it exists already (for updates sake)
if [[ -f "$EASYPOST_CLI_LOCATION"/ep ]] ; then
    rm -f "$EASYPOST_CLI_LOCATION"/ep
fi

# Install the EasyPost CLI
mkdir -p "$HOME"/.easypost-cli
curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/src/ep > "$EASYPOST_CLI_LOCATION"/ep
curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/src/.config > "$EASYPOST_CLI_HOME_LOCATION"/.config
curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/docs/man.md > "$EASYPOST_CLI_HOME_LOCATION"/man.md
chmod +x "$EASYPOST_CLI_LOCATION"/ep

# API Key setup
echo "Enter your EasyPost API key:"
read -r EASYPOST_CLI_API_KEY
sed -i '' "s/EASYPOST_CLI_API_KEY=.*/EASYPOST_CLI_API_KEY=$EASYPOST_CLI_API_KEY/" "$EASYPOST_CLI_HOME_LOCATION"/.config
echo "EasyPost CLI installed!"

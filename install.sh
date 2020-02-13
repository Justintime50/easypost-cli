#!/bin/bash

# Pull EasyPost CLI
echo "Installing EasyPost CLI..."
EASYPOST_CLI_LOCATION="$HOME"/easypost-cli
if [[ -d "$HOME"/easypost-cli ]] ; then 
    rm -rf "$HOME"/easypost-cli 
fi
git clone https://github.com/Justintime50/easypost-cli.git "$HOME"/ep-cli-temp > /dev/null 2>&1

# Install EasyPost CLI
mkdir "$EASYPOST_CLI_LOCATION" && mkdir "$EASYPOST_CLI_LOCATION"/bin
for DIR in "$HOME"/ep-cli-temp/src/* ; do
    cp -r "$DIR"/. "$EASYPOST_CLI_LOCATION"/bin
done > /dev/null 2>&1
cp -a "$HOME"/ep-cli-temp/src/easypost-cli.sh "$EASYPOST_CLI_LOCATION"/easypost-cli.sh
cp -a "$HOME"/ep-cli-temp/src/.env.example "$EASYPOST_CLI_LOCATION"/.env
cp -a "$HOME"/ep-cli-temp/docs "$EASYPOST_CLI_LOCATION"/docs
rm -rf "$HOME"/ep-cli-temp

# API Key setup
echo "Enter your EasyPost API key:"
read -r KEY
sed -i '' -e "s/EASYPOST_API_KEY=/EASYPOST_API_KEY=$KEY/g" "$EASYPOST_CLI_LOCATION"/.env
echo "EasyPost CLI installed!"

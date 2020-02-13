#!/bin/bash

# Pull EasyPost CLI
echo "Installing EasyPost CLI..."
if [[ -d "$HOME"/easypost-cli ]] ; then 
    rm -rf "$HOME"/easypost-cli 
fi
git clone https://github.com/Justintime50/easypost-cli.git "$HOME"/ep-cli-temp > /dev/null 2>&1

# Install EasyPost CLI
mkdir "$HOME"/easypost-cli && mkdir "$HOME"/easypost-cli/bin
for DIR in "$HOME"/ep-cli-temp/src/* ; do
    cp -r "$DIR"/. "$HOME"/easypost-cli/bin
done > /dev/null 2>&1
cp -a "$HOME"/ep-cli-temp/src/easypost-cli.sh "$HOME"/easypost-cli/easypost-cli.sh
cp -a "$HOME"/ep-cli-temp/src/.env.example "$HOME"/easypost-cli/.env
cp -a "$HOME"/ep-cli-temp/docs "$HOME"/easypost-cli/docs
rm -rf "$HOME"/ep-cli-temp

# API Key setup
echo "Enter your EasyPost API key:"
read -r KEY
shopt -s dotglob # Ensure we can replace the hidden .env file
sed -i '' -e "s/EASYPOST_API_KEY=/EASYPOST_API_KEY=$KEY/g" .env
echo "EasyPost CLI installed!"

#!/bin/bash

echo "Installing EasyPost CLI..."
if [[ -d "$HOME"/easypost-cli ]] ; then 
    rm -rf "$HOME"/easypost-cli 
fi
shopt -s dotglob # Ensure we can replace the hidden .env file
cd "$HOME" || exit
git clone https://github.com/Justintime50/easypost-cli.git ep-cli-temp > /dev/null 2>&1
cp -a "$HOME"/ep-cli-temp/src/. "$HOME/easypost-cli"
cp -a "$HOME"/ep-cli-temp/docs "$HOME/easypost-cli/docs"
rm -rf "$HOME"/ep-cli-temp
cd "$HOME/easypost-cli" || exit
cp .env.example .env
echo "Enter your EasyPost API key:"
read -r KEY
sed -i '' -e "s/EASYPOST_API_KEY=/EASYPOST_API_KEY=$KEY/g" .env
echo "EasyPost CLI installed!"

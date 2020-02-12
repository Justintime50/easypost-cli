#!/bin/bash

echo "Installing EasyPost CLI..."
cd "$HOME" || exit
git clone https://github.com/Justintime50/easypost-cli.git ep-cli-temp > /dev/null 2>&1
cp -a "$HOME"/ep-cli-temp/src/. "$HOME/easypost-cli"
rm -rf "$HOME"/ep-cli-temp
# shellcheck disable=SC1090
source ~/.zshrc
echo "EasyPost CLI installed!"

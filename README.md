# EasyPost CLI

Easily interact with the EasyPost API via the CLI.

[![Build Status](https://travis-ci.org/Justintime50/easypost-cli.svg?branch=master)](https://travis-ci.org/Justintime50/easypost-cli)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Written in pure shell and only requiring curl, the EasyPost CLI is portable and simple to use. View the official EasyPost [documentation here](https://www.easypost.com/docs/api) for more information.

## Install

Install EasyPost CLI:

```bash
# 1) Downloads, installs, and configures API key for you (requires git)
curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/install.sh | bash

# 2) Add to your ~/.zshrc or ~/.bash_profile
echo "# Source EasyPost CLI
if [ -f "$HOME"/easypost-cli/easypost-cli.sh ]; then
    source "$HOME"/easypost-cli/easypost-cli.sh
fi" >> ~/.zshrc

# 3) Source the changes which loads the library
source ~/.zshrc
```

## Updating

Updating the EasyPost CLI is as simple as running the first command in the install section above.

## Usage

```bash
# Create a shipment with a single command
ep-create-shipment
```

### Documentation

View all the accompanying [docs here](/docs/README.md).

# EasyPost CLI

Easily interact with the EasyPost API via the CLI.

[![Build Status](https://travis-ci.org/Justintime50/easypost-cli.svg?branch=master)](https://travis-ci.org/Justintime50/easypost-cli)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Written in pure `Bash` and only requiring `cURL`, the EasyPost CLI is portable and simple to use. View the official EasyPost [documentation here](https://www.easypost.com/docs/api) for more information about the API or view the accompanying EasyPost CLI [docs here](/docs/DOCS.md).

## Install

Install EasyPost CLI:

```bash
# 1) Downloads, installs, and configures the EasyPost CLI
bash <(curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/install.sh)
```

### Updating

Updating the EasyPost CLI is as simple as running the installation command above.

### Uninstall

```bash
bash <(curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/uninstall.sh)
```

## Usage

```bash
# Create a shipment with a single command
ep create-shipment
```

View the full accompanying EasyPost CLI [docs here](/docs/DOCS.md).

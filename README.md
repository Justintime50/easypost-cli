# EasyPost CLI

Easily interact with the EasyPost API via the CLI.

[![Build Status](https://travis-ci.org/Justintime50/easypost-cli.svg?branch=master)](https://travis-ci.org/Justintime50/easypost-cli)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Written in pure `Bash` and only requiring `cURL`, the EasyPost CLI is portable and simple to use. View the official [EasyPost documentation](https://www.easypost.com/docs/api) for more information about the API or visit the [EasyPost CLI website](https://justintime50.github.io/easypost-cli).

## What Can it Do?

At a high level, the EasyPost CLI can:
- Create and retrieve addresses, parcels, insurance, shipments, pickups, trackers, webhooks, batches, and more
- Buy labels, refund shipments, and rate carriers
- Create and retrieve custom reports
- Lookup EasyPost account details, create child users, and more

## Install on macOS & Linux

```bash
# 1) Install the EasyPost CLI
brew tap justintime50/easypost-cli
brew install easypost-cli

# 2) Configure the EasyPost CLI with your API key
echo "EASYPOST_CLI_API_KEY=<your_key_here>" >> ~/.easypost-cli-config
```

## Install on Windows (experimental)

**Compatibility:** Works on Windows 7 or later. Requires `Chocolatey` be installed first to install `jq`.

Download the EasyPost CLI installer and double click it. This will install the tool to `C:/easypost-cli`.

```batch
:: 1) Download and run the install script
curl -LJOs https://raw.githubusercontent.com/justintime50/easypost-cli/master/install-win.bat && install-win.bat

:: 2) Setup the config file with your API key
@echo EASYPOST_CLI_API_KEY=123... >> C:/easypost-cli/easypost-cli-config.bat
:: Hide the config file (optional but recommended)
attrib +h C:/easypost-cli/easypost-cli-config.bat

:: 3) Edit your path to allow the EasyPost CLI to be called from anywhere
setx PATH=%PATH%;C:\easypost-cli
```

## Usage

```bash
# Create a shipment with a single command, you will be prompted for details
ep create_shipment
```

### Documentation

View the full accompanying [EasyPost CLI Docs](/docs/man.md) for a comprehensive list of commands that can be used.

## Development

For a full breakdown of how the EasyPost CLI works under the hood, see the accompanying [EasyPost CLI Developer Docs](/docs/development.md).

### Building the EasyPost CLI

```bash
# Build the EasyPost CLI, passing in the version number as a parameter
./build.sh 1.1.2
```

### Running Unit Tests

Unit tests thus far are manually verified by checking the terminal output. Automated unit tests are in the works.

```bash
# Copy the test config
cp tests/.test-config-example tests/.test-config

# Run unit tests
./test.sh
```

## Roadmap

Most of the basic functionality of the EasyPost API is included in the EasyPost CLI to this point. Roadmap items would include adding all applicable `shipment options` as appropriate for a CLI tool, `customs info and items`, and additional request customization options.

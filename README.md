# EasyPost CLI

Easily interact with the EasyPost API via the CLI.

[![Build Status](https://travis-ci.org/Justintime50/easypost-cli.svg?branch=master)](https://travis-ci.org/Justintime50/easypost-cli)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Written in pure `Bash` and only requiring `cURL`, the EasyPost CLI is portable and simple to use. View the official EasyPost [documentation here](https://www.easypost.com/docs/api) for more information about the API or view the accompanying EasyPost CLI [docs here](/docs/DOCS.md).

## What Can it Do?

At a high level, the EasyPost CLI can:
- Create and retrieve addresses, parcels, insurance, shipments, and trackers
- Buy labels, refund shipments, and rate carriers
- Create and retrieve custom reports
- Lookup EasyPost account details

## Install

Install the EasyPost CLI into the default location `/usr/local/bin` which should already be in your path:

```bash
# 1) Downloads, installs, and configures the EasyPost CLI
bash <(curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/install.sh)
```

### Updating

Updating the EasyPost CLI is as simple as running the installation command above. You will be prompted for your EasyPost API key again.

### Uninstall

```bash
# Completely removes the EasyPost CLI from its default location
bash <(curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/uninstall.sh)
```

## Usage

```bash
# Create a shipment with a single command
ep create-shipment
```

View the full accompanying [EasyPost CLI Docs](/docs/man.md) for a comprehensive list of commands that can be used.

## Development

For a full breakdown of how the EasyPost CLI works under the hood, see the accompanying [EasyPost CLI Developer Docs](/docs/developer.md).

### Building the EasyPost CLI

```bash
# Build a single `ep` executable file for the EasyPost CLI
./build.sh
```

## Roadmap

Most of the basic functionality of the EasyPost API is included in the EasyPost CLI to this point. Roadmap items would include adding all applicable `shipment options` as appropriate for a CLI tool, `customs info and items`, and additional request customization options.

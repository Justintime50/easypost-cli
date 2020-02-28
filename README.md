# EasyPost CLI

Easily interact with the EasyPost API via the CLI.

[![Build Status](https://travis-ci.org/Justintime50/easypost-cli.svg?branch=master)](https://travis-ci.org/Justintime50/easypost-cli)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Written in pure `Bash` and only requiring `cURL`, the EasyPost CLI is portable and simple to use. View the official [EasyPost documentation](https://www.easypost.com/docs/api) for more information about the API or view the accompanying [EasyPost CLI docs](/docs/DOCS.md).

## What Can it Do?

At a high level, the EasyPost CLI can:
- Create and retrieve addresses, parcels, insurance, shipments, pickups, trackers, webhooks, batches, and more
- Buy labels, refund shipments, and rate carriers
- Create and retrieve custom reports
- Lookup EasyPost account details, create child users, and more

## Install

```bash
# 1) Install the EasyPost CLI
brew tap justintime50/easypost-cli
brew install easypost-cli

# 2) Configure the EasyPost CLI with your API key
echo "EASYPOST_CLI_API_KEY=<your_key_here>" >> ~/.easypost-cli-config
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
# Build a single `ep` executable file for the EasyPost CLI
./build.sh
```

### Running Unit Tests

Unit tests thus far are manually verified by checking the terminal output. Automated unit tests are in the works.

```bash
# Copy the test config (from `tests` dir)
cp .test-config-example .test-config

# Run unit tests (from `tests` dir)
./unit-tests.sh
```

## Roadmap

Most of the basic functionality of the EasyPost API is included in the EasyPost CLI to this point. Roadmap items would include adding all applicable `shipment options` as appropriate for a CLI tool, `customs info and items`, and additional request customization options.

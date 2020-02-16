# EasyPost CLI

Easily interact with the EasyPost API via the CLI.

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

Written in pure `Bash` and only requiring `cURL`, the EasyPost CLI is portable and simple to use. View the official EasyPost [documentation here](https://www.easypost.com/docs/api) for more information about the API or view the accompanying EasyPost CLI [docs here](/docs/DOCS.md).

## Install

Install EasyPost CLI into the default location `/usr/local/bin` which should already be in your path:

```bash
# 1) Downloads, installs, and configures the EasyPost CLI
bash <(curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/install.sh)
```

You'll be prompted for your EasyPost API key during installation. This can be updated after in the executable file at `/usr/local/bin/ep`.

### Updating

Updating the EasyPost CLI is as simple as running the installation command above.

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

View the full accompanying EasyPost CLI [docs here](/docs/DOCS.md).

## Building EasyPost CLI

The EasyPost CLI is broken up into separate microservices. Each endpoint or command is its own bash script. Each script is compiled into a single executable file tacking on configuration at the beginning and a command router at the end.

To build the executable, make sure all single scripts only include their respective single function and run the following which will place an `ep` executable file in the `src` folder. This should be done with each push to master as the installation script relies on an up-to-date version of the `ep` executable to be present in the `src` folder.

```bash
# Build a single `ep` executable file for the EasyPost CLI
./build.sh
```

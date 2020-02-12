# EasyPost CLI

Easily interact with the EasyPost API via the CLI.

## Install

Install EasyPost CLI:

```bash
curl -s https://raw.githubusercontent.com/justintime50/easypost-cli/master/install.sh | bash
cd ~/easypost-cli
cp .env.example .env # Then add your API key
```

Include the following in your `.zshrc` or `.bash_profile`:

```bash
# Source EasyPost Aliases
if [ -f "$HOME"/easypost-cli/.easypost_cli_aliases ]; then
    source "$HOME"/easypost-cli/.easypost_cli_aliases
fi
```

## Usage

```bash
# The following are commands that can be used:
ep-create-address
ep-create-shipment
ep-create-parcel

ep-retrieve-address
ep-retrieve-shipment
ep-retrieve-parcel

ep-buy-shipment
```

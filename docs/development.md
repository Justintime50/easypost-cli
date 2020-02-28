# EasyPost CLI Development Docs

The EasyPost CLI is a complex system of shell scripts and curl requests. The design is unique and as such warrants a set of development documentation separate from the user documentation.

## Overview

The EasyPost CLI is built in pure `Bash` and only requires `cURL` to work. There are a couple of instances of commands such as `sed`, `cat`, `if statements`, and others but the majority of everything happens via API calls over `cURL`. Although there are more powerful languages out there to build a command line tool with, the decision was made to use `Shell` and `cURL` only for portability and simplicity. The EasyPost CLI should work across `macOS` and most flavors of `Linux` as the executable has been tested with `bash`, `sh`, `dash`, and `ksh` shells. Because the tool was built as Shell scripts, some creativity was necessary in creating a working executable with the minimal amount of dependencies and overhead.

## Breakdown

The EasyPost CLI ultimately has 5 parts:

1. **Core Logic**
    - The core logic script imports the config file and handles any other core functionality of the tool. This is built at the beginning of the executable. **The shell shebang also lives here.**
1. **Config**
    - The config file carries variables necessary to run the tool including the provided EasyPost API key. The config file is placed in the user's home folder by default during installation.
1. **Endpoints**
    - The endpoints for each EasyPost API call that can be made are broken up into several pieces, each command or endpoint being its own shell script for simplicity and readability. These are built in the middle of the executable and can be found separated into categories of folders in the `src` directory.
1. **Command Router**
    - The command router searches the library of endpoints and points the user's command to that endpoint or returns an error saying that no such endpoint exists. This is built at the end of the executable.
1. **EasyPost CLI Executable**
    - The EasyPost CLI executable `ep` is built from `items 1, 3, and 4` in their respective orders. A build script concatenates all of these records into a single executable file which is then placed in the user's path, ready to be called upon in the syntax of `ep my_command`.
    
## Building the EasyPost CLI Executable

The EasyPost CLI is broken up into separate microservices. Each endpoint or command is its own shell script. Each script is compiled into a single executable file tacking on configuration at the beginning and a command router at the end.

To build the executable, make sure all single scripts only include their respective single function and run the following which will place an `ep` executable file in the `src` folder. **This should be done with each push to master** as the installation script relies on an up-to-date version of the `ep` executable to be present in the `src` folder for the installation script to pull the correct file.

```bash
# Build a single `ep` executable file for the EasyPost CLI
./build.sh
```

## Building the EasyPost CLI Homebrew Formula

Find more information on the [formula repo](https://github.com/Justintime50/homebrew-easypost-cli).

## Running Unit Tests

Unit tests thus far are manually verified by checking the terminal output. Automated unit tests are in the works.

***NOTE:** Unit test paths are relative to the `tests` folder.*

```bash
# Copy the test config (from `tests` dir)
cp .test-config-example .test-config

# Run unit tests (from `tests` dir)
./unit-tests.sh
```

## Testing/Linting

Testing and Linting occur via Travis CI with Shellcheck on the `ep` executable file itself, not on each individual shell script as testing would fail due to missing shebangs etc. Build, install, and uninstall scripts are also tested.

### Shells that are tested:

The EasyPost CLI was intended to be used in `bash` but can instead be installed and run in `sh`, `dash`, or `ksh` if elected. Simply change the shebang in the `ep` executable found at the default Homebrew installation location.

- bash
- sh
- dash
- ksh

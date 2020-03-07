# EasyPost CLI Development Docs

The EasyPost CLI is a complex system of shell scripts and curl requests. The design is unique and as such warrants a set of development documentation separate from the user documentation.

## Overview

The EasyPost CLI is built in pure `Bash` and only requires `cURL` to work. There are a couple of instances of commands such as `sed`, `cat`, `if statements`, and others but the majority of everything happens via API calls over `cURL`. Although there are more powerful languages out there to build a command line tool with, the decision was made to use `Shell` and `cURL` only for portability and simplicity. The EasyPost CLI should work across `macOS` and most flavors of `Linux` as the executable has been tested and can be built with `bash`, `dash`, `sh`, and `ksh` shells. Because the tool was built as Shell scripts, some creativity was necessary in creating a working executable with the minimal amount of dependencies and overhead.

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

To build the executable, make sure all single scripts only include their respective single function and run the following which will place an `ep` executable file in the `src` folder. **This should be done with each push to master** as the installation script relies on an up-to-date version of the `ep` executable to be present in the `src` folder for the installation script to pull the correct file. When running the build script, you must pass a version number as a parameter. Optionally, you can pass in `bash`, `dash`, `sh`, or `ksh` as shell interpreters which will change the shebang on the compiled executable. `Bash` is the default option; if a shell is omitted, bash will be used.

```bash
# Build the EasyPost CLI, passing in the version number and desired shell interpreter as a parameters
./build.sh 1.1.2 bash
```

Once the CLI executable has been built, you'll need to grab the output `checksum`, `version`, and `filename` and update that data in the Homebrew Formula found at the link below.

### Building for Windows

There is an expiremental build functionality to convert the Bash EasyPost CLI into a Windows Batch equivelant. This logic lives in the `win-interpreter.sh` file. The file is completely documented. The rationale is instead of developing the CLI for 2-3 sets of OS's, we build the CLI in pure Bash and have a tool like this to convert it into a Windows equivelant. Building for windows happens at the same time as building for macOS/Linux.

## Building the EasyPost CLI Homebrew Formula

Find more information on the [formula repo](https://github.com/Justintime50/homebrew-easypost-cli).

## Running Unit Tests

Unit tests thus far are manually verified by checking the terminal output. Automated unit tests are in the works.

***NOTE:** Unit test paths are relative to the `tests` folder.*

```bash
# Copy the test config
cp tests/.test-config-example tests/.test-config

# Run unit tests
./test.sh
```

## Testing/Linting

Testing and Linting occur via Travis CI with Shellcheck on the `ep` executable file itself, not on each individual shell script as testing would fail due to missing shebangs etc. Build, install, and uninstall scripts are also tested.

### Shells that are tested:

The EasyPost CLI was intended to be used in `bash` but can instead be installed and run in `sh`, `dash`, or `ksh` if elected. Simply specify a different shell when building the executable.

- bash
- dash
- sh
- ksh

## Website

The EasyPost CLI website is currently hosted on `GitHub Pages` from the `master branch` and the `docs` folder. Each time a commit is made to master, the website will be built with any new changes to the docs folder.

## Install on Windows (experimental)

**Compatibility:** Works on Windows 7 or later. Requires `Chocolatey` be installed first.

Download the EasyPost CLI installer and double click it. This will install the tool to `C:/easypost-cli/ep`.

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

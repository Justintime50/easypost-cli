# EasyPost CLI Developer Docs

The EasyPost CLI is a complex system of bash scripts and curl requests. The design is unique and as such warrants a development set of documentation.

## Overview

The EasyPost CLI is built in pure `Bash` and only requires `cURL` to work. There are a couple of instances of the `sed` or `cat` commands being used but the majority of everything happens via API calls over cURL. Although there are more powerful languages out there to build a command line tool with, the decision was made to use Bash and cURL only for portability and simplicity. The EasyPost CLI should work across `macOS` and most flavors of `Linux`. Because the tool was built as Bash scripts, some creativity was necessary in creating a working executable with the minimal amount of dependencies and overhead.

## Breakdown

The EasyPost CLI ultimately has 5 parts:

1. **Core Logic**
    - The core logic script imports the config file and handles any other core functionality of the tool. This is built at the beginning of the executable.
1. **Config**
    - The config file carries variables necessary to run the tool including the EasyPost API key.
1. **Endpoints**
    - The endpoints for each EasyPost API call that can be made are broken up into several pieces, each command or endpoint being its own shell script for simplicity and readability. These are built in the middle of the executable.
1. **Command Router**
    - The command router searches the library of endpoints and points the user's command to that endpoint or returns an error saying that no such endpoint exists. This is built at the end of the executable.
1. **EasyPost CLI Executable**
    - The EasyPost CLI executable `ep` is built from items 1, 3, and 4 in their respective orders. A build script concatenates all of these records into a single executable file which is then placed in the user's path, ready to be called upon in the syntax of `ep my-command`.
    
## Building the EasyPost CLI

The EasyPost CLI is broken up into separate microservices. Each endpoint or command is its own bash script. Each script is compiled into a single executable file tacking on configuration at the beginning and a command router at the end.

To build the executable, make sure all single scripts only include their respective single function and run the following which will place an `ep` executable file in the `src` folder. This should be done with each push to master as the installation script relies on an up-to-date version of the `ep` executable to be present in the `src` folder.

```bash
# Build a single `ep` executable file for the EasyPost CLI
./build.sh
```

## Testing/Linting

Testing and Linting occur via Travis CI with Shellcheck on the `ep` executable file itself, not on each individual shell script as testing would fail due to missing shebangs etc. Build, install, and uninstall scripts are also tested.
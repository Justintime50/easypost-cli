# EasyPost CLI Development Docs

The EasyPost CLI is made up of shell scripts and curl requests. The design is unique and as such warrants a set of development documentation separate from the user documentation.

## Overview

The EasyPost CLI is built in pure `Bash` and only requires `cURL` to work. There are certainly better ways to build a CLI like using a scripting or compile language and then distributing a single binary but I wanted to try doing things the hard way and build an entire project in Bash. There are a couple of instances of commands such as `sed`, `cat`, `if statements`, and others but the majority of everything happens via API calls over `cURL`. Although there are more powerful languages out there to build a command line tool with, the decision was made to use `Shell` and `cURL` for portability and simplicity. The EasyPost CLI should work across `macOS`, `Linux`, and `Windows` (when converted during the build process). On Unix system, the executable has been tested and can be built with `bash`, `dash`, `sh`, and `ksh` shells. Because the tool was built as Shell scripts, some creativity was necessary in creating a working executable with the minimal amount of dependencies and overhead.

## Breakdown

The EasyPost CLI ultimately has 4 parts:

1. **Init**
    - The `init` script imports the config file and handles any other core functionality of the tool including running checks to ensure the environment is setup correctly and routing the command passed to the right function. This is built at the beginning of the executable. The shell shebang also lives here for Unix. (A `init` file can be found for both Unix and Windows.)
1. **Config**
    - The config file carries variables necessary to run the tool including the provided EasyPost API key. The config file is placed in the user's home folder by default during installation and is not found in this repo.
1. **Functions**
    - The functions for each EasyPost API call (endpoint) that can be made are broken up into several pieces, each category of endpoints being its own shell script for simplicity and readability. These are built in the middle of the executable and can be found separated into categories of folders in the `src/functions` directory.
1. **EasyPost CLI Executable**
    - The EasyPost CLI executables (`unix_ep.sh`, and `windows_ep.bat`) are built from `items 1 and 3`. A build script concatenates all of these records into a single executable file which is then placed in the user's path, ready to be called upon in the syntax of `ep my_command`.

## Building the EasyPost CLI Executables

**Note:** Building should be done with each push to master!

When running the build script, you must pass a version number as the first parameter. Optionally, you can pass in `bash`, `dash`, `sh`, or `ksh` as a second parameter which will change the shebang on the compiled executable (Unix only). Bash is the default option; if a shell parameter is omitted, `bash` will be used.

```bash
./utils/build.sh 1.1.2 bash
```

### Building for Windows

There is an expiremental build functionality to convert the Bash EasyPost CLI into a Windows Batch equivelant. This logic lives in the `windows-interpreter.sh` file. The file is completely documented. The rationale is instead of developing the CLI for 2-3 sets of OS's, we build the CLI in pure Bash and have a tool like this to convert it into a Windows equivelant. Building for windows happens at the same time as building for macOS/Linux.

### Testing Supported Shells

The EasyPost CLI was intended to be used in `bash` but can instead be installed and run in `sh`, `dash`, or `ksh` if elected. Simply specify a different shell when building the executable or linting the project.

- bash
- dash
- sh
- ksh

```bash
shellcheck src/*.sh --shell=dash
```

## Website

The EasyPost CLI website is currently hosted on `GitHub Pages` from the `main` branch and the `docs` folder. Each time a commit is made to master, the website will be built with any new changes to the docs folder.

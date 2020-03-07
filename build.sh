#!/bin/bash

# Build the single EasyPost executable across various OS's

build() {
    FILENAME="src/ep"

    # Ensure a version number is passed in
    if [ -z "$1" ] ; then
        printf "%s\n" "ERROR: A version number must be provided!"
        exit 1
    fi

    # Remove the EasyPost CLI executable if it exists
    if [ -f "$FILENAME" ] ; then
        rm -f "$FILENAME"
    fi

    # Set the shell shebang passed in (eg: bash, dash, sh, ksh)
    SHEBANG="$2"
    if [ -z "$2" ] ; then
        SHEBANG="bash"
    fi
    # TODO: Fix this, haven't been able to get it working
    # if ! [ "$SHEBANG" = "bash" ] || [ "$SHEBANG" = "dash" ] || [ "$SHEBANG" = "sh" ] || [ "$SHEBANG" = "ksh" ] ; then
    #     echo "The EasyPost CLI can only be built with the following shell parameters: bash, dash, sh, ksh. Please try again."
    #     exit 1
    # fi
    printf "%s\n" "#!/bin/$SHEBANG" >> "$FILENAME"

    # Build the core logic & config
    cat src/core-logic.sh >> "$FILENAME"

    # Build each endpoint
    for DIR in src/* ; do
        if [ -d "$DIR" ] ; then
            cat "$DIR"/*.sh >> "$FILENAME"
        fi
    done

    # Build the command router
    cat src/command-router.sh >> "$FILENAME"

    # Update version number found in executable
    sed -i "" "s;EASYPOST_CLI_VERSION=.*;EASYPOST_CLI_VERSION=\"$1\";" "$FILENAME"

    # Make the EasyPost CLI executable
    chmod +x "$FILENAME"

    # Create Homebrew Tar file and print checksum
    tar -czf homebrew/easypost-cli-"$1".tgz "$FILENAME"
    printf "Tar File: easypost-cli-%s.tgz" "$1"
    printf "\nVersion: %s" "$1"
    printf "\nChecksum: "
    shasum -a 256 homebrew/easypost-cli-"$1".tgz
}

build_win() {
    FILENAME="src/ep-win"
    TEMP="src/ep-win-temp"

    # Ensure a version number is passed in
    if [ -z "$1" ] ; then
        printf "%s\n" "ERROR: A version number must be provided!"
        exit 1
    fi

    # Remove the EasyPost CLI executable if it exists
    if [ -f "$FILENAME" ] ; then
        rm -f "$FILENAME"
    fi
    if [ -f "$TEMP" ] ; then
        rm -f "$TEMP"
    fi

    # Build each endpoint
    for DIR in src/* ; do
        if [ -d "$DIR" ] ; then
            cat "$DIR"/*.sh >> "$TEMP"
        fi
    done

    # Update version number found in executable
    sed -i "" "s;EASYPOST_CLI_VERSION=.*;EASYPOST_CLI_VERSION=$1;" "$TEMP"

    # Source the Windows Interpreter and do some magic
    # shellcheck disable=SC1091
    . src/win-interpreter.sh

    {
    # Build the Windows command router
    cat src/command-router.bat

    # Grab the temp file and put it in the real one
    cat "$TEMP"

    # Add the eof tag
    printf "\n:eof\n" 
    } >> "$FILENAME"

    # Remove the EasyPost CLI temp file
    if [ -f "$TEMP" ] ; then
        rm -f "$TEMP"
    fi

}

# Invoke the build functions
build "$1" "$2"
build_win "$1"

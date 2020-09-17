#!/bin/bash

# Build the single EasyPost executable across various OS's

build_unix() {
    FILENAME="dist/unix_ep.sh"

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
    for FILE in src/functions/* ; do
        if [ -f "$FILE" ] ; then
            cat "$FILE" >> "$FILENAME"
        fi
    done

    # Build the command router
    cat src/command-router.sh >> "$FILENAME"

    # Update version number found in executable
    sed -i "" "s;EASYPOST_CLI_VERSION=.*;EASYPOST_CLI_VERSION=\"$1\";" "$FILENAME"

    # Make the EasyPost CLI executable
    chmod +x "$FILENAME"

    printf "%s\n" "Unix $1 EasyPost CLI executable built!"
}

build_win() {
    FILENAME="dist/windows_ep.bat"
    TEMP_FILE="dist/windows_ep_temp.bat"

    # Ensure a version number is passed in
    if [ -z "$1" ] ; then
        printf "%s\n" "ERROR: A version number must be provided!"
        exit 1
    fi

    # Remove the EasyPost CLI executable if it exists
    if [ -f "$FILENAME" ] ; then
        rm -f "$FILENAME"
    fi
    if [ -f "$TEMP_FILE" ] ; then
        rm -f "$TEMP_FILE"
    fi

    # Build each endpoint
    for FILE in src/functions/* ; do
        if [ -f "$FILE" ] ; then
            cat "$FILE" >> "$TEMP_FILE"
        fi
    done

    # Source the Windows Interpreter and do some magic
    # shellcheck disable=SC1091
    . src/win-interpreter.sh

    {
        # Build the Windows command router
        cat src/command-router.bat

        # Grab the TEMP_FILE file and put it in the real one
        cat "$TEMP_FILE"

        # Add the eof tag
        printf "\n:eof\n" 
    } >> "$FILENAME"

    # Remove the EasyPost CLI TEMP_FILE file
    if [ -f "$TEMP_FILE" ] ; then
        rm -f "$TEMP_FILE"
    fi

    # Update version number found in executable
    sed -i "" "s;EASYPOST_CLI_VERSION=.*;EASYPOST_CLI_VERSION=$1;" "$FILENAME"

    printf "%s\n" "Windows $1 EasyPost CLI executable built!"
}

# Invoke the build functions
build_unix "$1" "$2"
build_win "$1"

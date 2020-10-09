#!/bin/bash

# Build the executables that will work on Linux, macOS, and Windows
# Usage: ./utils/build.sh 1.0.0 bash

check_for_version_number() {
    # Ensure a version number is passed in
    if [ -z "$1" ] ; then
        printf "%s\n" "ERROR: A version number must be provided!"
        exit 1
    fi
}

clean_files() {
    # Remove the filename passed to this function if it exists
    if [ -f "$1" ] ; then
        rm -f "$1"
    fi
}

build_functions() {
    # Build each set of functions and add it to the file
    for FILE in src/functions/* ; do
        if [ -f "$FILE" ] ; then
            cat "$FILE" >> "$1"
        fi
    done
}

prepare_shebang() {
    # Set the shell shebang passed in (eg: bash, dash, sh, ksh)
    SHEBANG="$1"
    if [ -z "$1" ] ; then
        SHEBANG="bash"
    fi
    if [ "$SHEBANG" != "bash" ] && [ "$SHEBANG" != "dash" ] && [ "$SHEBANG" != "sh" ] && [ "$SHEBANG" != "ksh" ] ; then
        echo "The EasyPost CLI can only be built with the following shell parameters: (bash | dash | sh | ksh). You provided '$SHEBANG'. Please correct and try again."
        exit 1
    fi
}

update_version_number() {
    # Update version placeholder found in the executable
    sed -i "" "s;VERSION_PLACEHOLDER;$1;" "$FILENAME"
}

make_file_executable() {
    # Make the file passed to this function executable
    chmod +x "$1"
}

build_unix() {
    FILENAME="dist/unix_ep.sh"

    check_for_version_number "$1"
    clean_files "$FILENAME"

    prepare_shebang "$2"
    printf "%s\n" "#!/bin/$SHEBANG" >> "$FILENAME"

    # Build the executable file
    cat src/init.sh >> "$FILENAME"
    build_functions "$FILENAME"
    printf "\n%s\n" "main \"\$1\"" >> "$FILENAME"

    update_version_number "$1"
    make_file_executable "$FILENAME"
    printf "%s\n" "Unix \"$1\" EasyPost CLI executable built for \"$SHEBANG\"!"
}

build_windows() {
    FILENAME="dist/windows_ep.bat"
    TEMP_FILE="dist/windows_ep_temp.bat"

    check_for_version_number "$1"
    clean_files "$FILENAME"

    # Build the functions to a temp file, then run the windows-interpreter 
    # tool to convert from Shell to Batch
    build_functions "$TEMP_FILE"
    ./utils/windows-interpreter.sh "$TEMP_FILE"

    # Build the real executable file passing in the temp data that is now converted
    {
        cat src/init.bat
        cat "$TEMP_FILE"
        printf "\n%s\n" "main %1" >> "$FILENAME"
    } >> "$FILENAME"

    update_version_number "$1"
    clean_files "$TEMP_FILE"
    printf "%s\n" "Windows \"$1\" EasyPost CLI executable built!"
}

# Invoke the build functions
build_unix "$1" "$2"
build_windows "$1"

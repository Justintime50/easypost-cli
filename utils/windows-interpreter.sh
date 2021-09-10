#!/bin/bash

# shellcheck disable=SC2016

main() {
    # INTRO: Interpret the Bash executable for Windows and do text replacement across the entire file
    # PURPOSE: Instead of developing the CLI for 2-3 sets of OS's or requiring other dependencies, we build the CLI in pure Bash and have a tool like this to convert it into a Windows equivalent.
    # NOTE: This tool is not guaranteed to build a Windows executable correctly; however, every effort has been made to ensure it works as anticipated.
    # COMPATIBILITY: This script assumes you are running the `BSD` version of `sed` and NOT the `GNU` version, as such, it may only be compatible with macOS
    # ORDER: comments with `!important` must come first, they probably have another rule farther down that breaks them if they happen after.
    # USAGE: ./windows-interpreter.sh path/to/file_to_interpret.sh

    # Specify the file to edit
    FILENAME="$1"

    # The following `sed` commands use `-i` for "edit in-place", `s` for "substitute", and `g` for "global", meaning the entire file
    # Unlike the traditional `/` used as a delimiter, we are using `;` for better readability

    # General changes
    remove_shebang
    change_functions
    change_explicit_variables
    change_line_continuation
    change_input_prompt
    change_print
    change_comments
    change_quotes
    change_open
    change_variables


     sed -i "" 's;" ^;%" ^;g;' "$FILENAME"   # !important -- add missing `%` for variables in a data field (must come before the following lines)

    sed -i "" 's;%" \^$;;g;' "$FILENAME" # Remove all line continuation from data fields and curls (must be paired with the following lines)

    # TODO: This is breaking items such as `is_return` and the stamp data fields that are hardcoded and not variables
    sed -i "" 's;^    -d .*;&%" \^;g;' "$FILENAME" # Put back the curl line continuations

    sed -i "" 's;[A-Z]$;&% \^;g;' "$FILENAME"   # If the line ends with an uppercased variable (eg: curl lines), put back the line continuation



    cleanup
}

remove_shebang() {
    sed -i "" 's;^#!/bin;;' "$FILENAME" # remove the shebang
}

change_functions() {
    sed -i "" 's;.*();:&;g;' "$FILENAME"        # !important -- change all functions that have a `()` to start with a `:`
    sed -i "" 's;();;g' "$FILENAME"             # remove `()` from each function name
    sed -i "" 's; {;;g;' "$FILENAME"            # remove opening function brackets
    sed -i "" 's;}$;exit /b 0;g;' "$FILENAME"   # change closing function brackets
}

change_explicit_variables() {
    sed -i "" 's;"$EASYPOST_API_URL";%EASYPOST_API_URL%;g;' "$FILENAME"         # change EASYPOST_API_URL
    sed -i "" 's;"$EASYPOST_CLI_API_KEY";%EASYPOST_CLI_API_KEY%;g;' "$FILENAME" # change EASYPOST_CLI_API_KEY
    sed -i "" 's;$STARTDATE;%STARTDATE%;g;' "$FILENAME"                         # !important -- change the STARTDATE variables
    sed -i "" 's;$ENDDATE;%ENDDATE%;g;' "$FILENAME"                             # !important -- change the ENDDATE variables
}

change_line_continuation() {
    sed -i "" 's;\\;^;g;' "$FILENAME"   # change line continuation from `\` to `^`
}

change_input_prompt() {
    sed -i "" 's;read -r;set /P;g;' "$FILENAME" # change input prompt from read to set
}

change_print() {
    sed -i "" 's;printf "%s^n";echo;g;' "$FILENAME" # change print command
    sed -i "" 's;json_pp;jq .;g;' "$FILENAME"       # change json_pp for jq (is a dependency on Windows)
}

change_comments() {
    sed -i "" 's;#;::;g;' "$FILENAME"   # change comments from bash to batch
}

change_quotes() {
    sed -i "" ';s;echo ";echo ;g;' "$FILENAME"  # remove beginning `"` from echo lines
    sed -i "" ';s; "$; ;g;' "$FILENAME"         # change closing `"` from echo lines
}

change_open() {
    sed -i "" 's;open;start;g;' "$FILENAME" # replace open with start for web pages
}

change_variables() {
    sed -i "" 's;\$;%;g;' "$FILENAME"       # change `$` to `%` generally
    sed -i "" 's;set.*;&=;g;' "$FILENAME"   # add `=` after setting each variable
    sed -i "" 's;"\/;%\/;g;' "$FILENAME"    # fix variables mixed in urls (not at the end)
    sed -i "" 's;\/"%;\/%;g;' "$FILENAME"   # fix variables mixed in urls (not at the end, cont.)
}

cleanup() {
    # Cleanup fixes (we broke something earlier so let's fix it here)
    sed -i "" 's;}%" ^;}" ^;g;' "$FILENAME" # fix what we broke before with options such as start_date and end_date
    sed -i "" 's;\^";";g;' "$FILENAME"      # fix the `eg` example quotes that we broke earlier
}

main "$1"

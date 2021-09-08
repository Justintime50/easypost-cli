#!/bin/bash

# shellcheck disable=SC2016

windows_interpreter() {
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
    sed -i "" 's;$STARTDATE;%STARTDATE%;g;' "$FILENAME"     # !important -- change the STARTDATE variables
    sed -i "" 's;$ENDDATE;%ENDDATE%;g;' "$FILENAME"         # !important -- change the ENDDATE variables
    sed -i "" 's;.*();:&;g;' "$FILENAME"                    # !important -- change all function `()` with `:`
    sed -i "" 's;#!/bin/bash;;' "$FILENAME"                 # remove the shebang
    sed -i "" 's;();;g' "$FILENAME"                         # remove `()` from each function name
    sed -i "" 's;\\;^;g;' "$FILENAME"                       # change line continuation from `\` to `^`
    sed -i "" 's;read -r;set /P;g;' "$FILENAME"             # change input prompt from read to set
    sed -i "" 's;printf "%s^n";echo;g;' "$FILENAME"         # change print command
    # sed -i "" "s;';\";g;" "$FILENAME"                     # change single quote for double quote (if there are stragglers) 
    sed -i "" 's;json_pp;jq .;g;' "$FILENAME"               # change json_pp for jq (is a dependency on Windows)
    sed -i "" 's;#;::;g;' "$FILENAME"                       # change comments from bash to batch
    sed -i "" 's; {;;g;' "$FILENAME"                        # remove opening function brackets
    sed -i "" 's;}$;exit /b 0;g;' "$FILENAME"               # change closing function brackets
    sed -i "" ';s;echo ";echo ;g;' "$FILENAME"              # remove beginning `"` from echo lines
    sed -i "" ';s; "$; ;g;' "$FILENAME"                     # change closing `"` from echo lines
    sed -i "" 's;open;start;g;' "$FILENAME"                 # replace open with start for web pages

    # Replace variables
    # TODO: These can be combined in the variables below?
    sed -i "" 's;"$EASYPOST_API_URL";%EASYPOST_API_URL%;g;' "$FILENAME"             # change EASYPOST_API_URL
    sed -i "" 's;"$EASYPOST_CLI_API_KEY";%EASYPOST_CLI_API_KEY%;g;' "$FILENAME"     # change EASYPOST_CLI_API_KEY
    sed -i "" 's;\$;%;g;' "$FILENAME"                                               # change `$` to `%`
    sed -i "" 's;=$;=%;g;' "$FILENAME"                                              # change `$` to `%` (cont.)
    sed -i "" 's;" ^;%" ^;g;' "$FILENAME"                                           # add missing `%` for variables in a data field
    sed -i "" 's;set.*;&=;g;' "$FILENAME"                                           # add `=` after setting each variable

    # URL variables
    sed -i "" 's;"%;%;g;' "$FILENAME"

    sed -i "" 's;"\/;%\/;g;' "$FILENAME"     # fix variables mixed in urls
    sed -i "" 's;\/"%;%\/%;g;' "$FILENAME"   # fix variables mixed in urls (cont.)

    sed -i "" 's;/% ^;/%" ^;g;' "$FILENAME"
    sed -i "" 's;=% ^;=%" ^;g;' "$FILENAME"

    # TODO: Get multiline mode working
    # TODO: Add in the last `3` chars here and remove the `"`
    sed -i "" 's;^    curl(.*)" \^$;lala;g;' "$FILENAME"   # TODO: fix variables mixed in urls via new lines


    # Cleanup fixes (we broke something earlier so let's fix it here)
    sed -i "" 's;}%" ^;}" ^;g;' "$FILENAME"     # fix what we broke before with options such as start_date and end_date
    sed -i "" 's;\^";";g;' "$FILENAME"          # fix the `eg` example quotes that we broke earlier
}

windows_interpreter "$1"

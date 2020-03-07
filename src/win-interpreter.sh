#!/bin/bash

# INTRO: Interpret the Bash executable for Windows and do text replacement across the entire file
# PURPOSE: Instead of developing the CLI for 2-3 sets of OS's, we build the CLI in pure Bash and have a tool like this to convert it into a Windows equivelant.
# NOTE: Please know this conversion tool was built quickly and is not guaranteed to build a Windows executable correctly. See LINTING.
# LINTING: There is no way to lint a batch file and therefore the output of this file is not checked for syntax and instead must be manually tested.
# COMPATIBILITY: This has only been tested on macOS 10.15 (Catalina), other variants of macOS of Linux may have different versions of the `sed` tool and may exhibit different behavior.
# ORDER: comments with `!important` must come first, they probably have another rule farther down that breaks them if they happen after.

# TODO: Ensure that this script is compatible on both macOS and Linux
# TODO: if & while statements in endpoints -- REMOVE THESE, VALIDATION ALREADY OCCURS ON THE EASYPOST SIDE

# Specify the file to edit
WIN_FILENAME="executables/windows/ep-temp"

# General changes
sed -i "" 's;$STARTDATE;%STARTDATE%;g;' "$WIN_FILENAME"     # !important -- change the STARTDATE variables
sed -i "" 's;$ENDDATE;%ENDDATE%;g;' "$WIN_FILENAME"         # !important -- change the ENDDATE variables
sed -i "" 's;.*();:&;g;' "$WIN_FILENAME"                    # !important -- change all function `()` with `:`
sed -i "" 's;#!/bin/bash;;' "$WIN_FILENAME"                 # remove the shebang
sed -i "" 's;();;g' "$WIN_FILENAME"                         # remove `()` from each function name
sed -i "" 's;\\;^;g;' "$WIN_FILENAME"                       # change line continuation from `\` to `^`
sed -i "" 's;read -r;set /P;g;' "$WIN_FILENAME"             # change input prompt from read to set
sed -i "" 's;printf "%s^n";echo;g;' "$WIN_FILENAME"         # change print command
# sed -i "" "s;';\";g;" "$WIN_FILENAME"                     # change single quote for double quote (if there are stragglers) 
sed -i "" 's;json_pp;jq .;g;' "$WIN_FILENAME"               # change json_pp for jq (is a dependency on Windows)
sed -i "" 's;#;::;g;' "$WIN_FILENAME"                       # change comments from bash to batch
sed -i "" 's; {;;g;' "$WIN_FILENAME"                        # remove opening function brackets
sed -i "" 's;}$;EXIT /B 0;g;' "$WIN_FILENAME"               # change closing function brackets
sed -i "" ';s;echo ";echo ;g;' "$WIN_FILENAME"              # remove beginning `"` from echo lines
sed -i "" ';s; "$; ;g;' "$WIN_FILENAME"                     # change closing `"` from echo lines
sed -i "" 's;open;start;g;' "$WIN_FILENAME"                 # replace open with start for web pages

# Replace variables
sed -i "" 's;"$EASYPOST_API_URL";%EASYPOST_API_URL%;g;' "$WIN_FILENAME"             # change EASYPOST_API_URL
sed -i "" 's;"$EASYPOST_CLI_API_KEY";%EASYPOST_CLI_API_KEY%;g;' "$WIN_FILENAME"     # change EASYPOST_CLI_API_KEY
sed -i "" 's;\$;%;g;' "$WIN_FILENAME"                                               # change `$` to `%`
sed -i "" 's;=$;=%;g;' "$WIN_FILENAME"                                              # change `$` to `%` (cont)
sed -i "" 's;" ^;%" ^;g;' "$WIN_FILENAME"                                           # add missing `%` for variables in a data field
sed -i "" 's;set.*;&=;g;' "$WIN_FILENAME"                                           # add `=` after setting each variable

# URL variables
# TODO: There is a better way to do this without explicitly calling these variables. This works during beta. Fix ASAP
sed -i "" 's;"%WEBHOOK%";%WEBHOOK%;g;' "$WIN_FILENAME"
sed -i "" 's;"%ADDRESS%";%ADDRESS%;g;' "$WIN_FILENAME"
sed -i "" 's;"%REPORT%";%REPORT%;g;' "$WIN_FILENAME"
sed -i "" 's;"%TRACKER%";%TRACKER%;g;' "$WIN_FILENAME"
sed -i "" 's;"%BATCH%";%BATCH%;g;' "$WIN_FILENAME"
sed -i "" 's;"%BATCH";%BATCH%;g;' "$WIN_FILENAME"
sed -i "" 's;"%SHIPMENT%";%SHIPMENT%;g;' "$WIN_FILENAME"
sed -i "" 's;"%SHIPMENT";%SHIPMENT%;g;' "$WIN_FILENAME"
sed -i "" 's;"%SCANFORM%";%SCANFORM%;g;' "$WIN_FILENAME"
sed -i "" 's;"%PICKUP%";%PICKUP%;g;' "$WIN_FILENAME"
sed -i "" 's;"%PICKUP";%PICKUP%;g;' "$WIN_FILENAME"
sed -i "" 's;"%PARCEL%";%PARCEL%;g;' "$WIN_FILENAME"
sed -i "" 's;"%INSURANCE%";%INSURANCE%;g;' "$WIN_FILENAME"
sed -i "" 's;"%CARRIER%";%CARRIER%;g;' "$WIN_FILENAME"
sed -i "" 's;"%USER%";%USER%;g;' "$WIN_FILENAME"

# Cleanup fixes (we broke something earlier so let's fix it here)
sed -i "" 's;}%" ^;}" ^;g;' "$WIN_FILENAME"     # fix what we broke before with options such as start_date and end_date
sed -i "" 's;\^";";g;' "$WIN_FILENAME"          # fix the `eg` example quotes that we broke earlier

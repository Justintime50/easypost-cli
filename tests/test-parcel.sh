#!/bin/bash

printf "%s\n" "Testing parcel object..."

# Source endpoints
# for FILE in ../src/parcels/create-parcel.sh ; do
#     . $FILE
# done

. ../src/parcels/create-parcel.sh

# Send dummy data
printf "%s\n" "%s\n" \
1 \
1 \
1 \
1 \
| \
create_parcel

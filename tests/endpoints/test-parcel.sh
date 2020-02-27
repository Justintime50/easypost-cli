#!/bin/bash

printf "%s\n" "Testing parcel..."

# Source config
. .test-config

# Test ep create_parcel
printf "%s\n" "Testing create_parcel..."
. ../src/parcels/create-parcel.sh
printf "%s\n" \
"1" \
"1" \
"1" \
"1" \
| \
create_parcel

# Test ep retrieve-parcel
printf "%s\n" "Testing retrieve_parcel..."
. ../src/parcels/retrieve-parcel.sh
printf "%s\n" \
"prcl_dac984463d394dbcb1802c4151844a34" \
| \
retrieve_parcel

printf "%s\n" "Parcel object tests complete!"

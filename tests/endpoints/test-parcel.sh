#!/bin/bash

printf "%s\n" "Testing parcel..."

# Source config
. tests/.test-config

# Test ep create_parcel
printf "%s\n" "Testing create_parcel..."
. src/parcels/create-parcel.sh
printf "%s\n" \
"12" \
"12" \
"12" \
"12" \
| \
create_parcel

# Test ep retrieve_parcel
printf "%s\n" "Testing retrieve_parcel..."
. src/parcels/retrieve-parcel.sh
printf "%s\n" \
"prcl_46ad2fc153f747c4a6d71f4f0a7ede60" \
| \
retrieve_parcel

printf "%s\n" "Parcel object tests complete!"

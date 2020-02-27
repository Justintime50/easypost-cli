#!/bin/bash

printf "%s\n" "Running unit tests..."

# Test ep create_parcel
for TEST in endpoints/* ; do
    if [ -f "$TEST" ] ; then
        ./"$TEST"
    fi
done

printf "%s\n" "Unit tests complete!"

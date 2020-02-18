#!/bin/bash

# Build the single EasyPost executable

echo "Building the EasyPost CLI executable..."

# Remove the EasyPost CLI executable if it exists
if [[ -f src/ep ]] ; then
    rm -f src/ep
fi

# Build the core logic & config
cat src/core-logic.sh >> src/ep

# Build each endpoint
for DIR in src/* ; do
    if [[ -d "$DIR" ]] ; then
        cat "$DIR"/*.sh >> src/ep
    fi
done

# Build the command router
cat src/command-router.sh >> src/ep

# Make the EasyPost CLI executable
chmod +x src/ep

echo "EasyPost CLI executable built!"

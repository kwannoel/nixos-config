#!/usr/bin/env bash

# TODO: Make it linux compatible
# Now it's only for Macos

# If not macos then exit
if [[ $(uname -s) != "Darwin" ]]; then
    echo "Only support macos"
    exit 1
fi


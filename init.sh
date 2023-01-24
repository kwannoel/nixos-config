#!/usr/bin/env bash

EXPECTED_CHANNEL_VERSION="nixos-22.11"

# Pin channel version
ACTUAL_CHANNEL_VERSION=$(sudo nix-channel --list\
    | awk '$1 == "nixos" { print $2 }'\
    | sed -E 's/https...nixos.org.channels.//')

echo "ACTUAL: $ACTUAL_CHANNEL_VERSION"

if [[ "$ACTUAL_CHANNEL_VERSION" == "$EXPECTED_CHANNEL_VERSION" ]]
then
    sudo nixos-rebuild switch -I nixos-config=/home/noel/nixos-config/configuration.nix
else
    echo "EXPECTED: $EXPECTED_CHANNEL_VERSION"
fi

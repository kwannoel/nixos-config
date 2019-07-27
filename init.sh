#!/bin/bash 

export NIXOS_CONFIG='/home/noel/nixos-config/configuration.nix'
sudo nixos-rebuild switch

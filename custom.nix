{ config, lib, pkgs, ... }:

let # minecraft = pkgs.minecraft.overrideAttrs (oldAttrs: rec {
    # version = "0.0.0.0";
    # src = builtins.fetchurl {
    #   url = "https://launcher.mojang.com/download/Minecraft.tar.gz";
    #   sha256 = "1cd0mpxqmci3m3y1xh5nbx68z69v0x1jyzc07siwfbxqkrlrddj9";
    # };
    # });
    neuronRev = "d6d5b8d869e3644cc698c08b66985790fd743853";
    neuronSrc = builtins.fetchTarball "https://github.com/srid/neuron/archive/${neuronRev}.tar.gz";
    neuron = import neuronSrc {};

in { environment.systemPackages = [ # minecraft
                                    neuron ]; }

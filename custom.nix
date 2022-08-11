{ config, lib, pkgs, ... }:

let # minecraft = pkgs.minecraft.overrideAttrs (oldAttrs: rec {
    # version = "0.0.0.0";
    # src = builtins.fetchurl {
    #   url = "https://launcher.mojang.com/download/Minecraft.tar.gz";
    #   sha256 = "1cd0mpxqmci3m3y1xh5nbx68z69v0x1jyzc07siwfbxqkrlrddj9";
    # };
    # });
    neuronRev = "f8b5fb597f85528ae4d7d1ded9e79ac901833665";
    neuronSrc = builtins.fetchTarball "https://github.com/srid/neuron/archive/${neuronRev}.tar.gz";
    # neuronSrc = builtins.fetchTarball "https://github.com/srid/neuron/archive/refs/tags/1.9.35.0.tar.gz";
    neuronPkg = import neuronSrc;
    neuron = neuronPkg.default;

in { environment.systemPackages = [ # minecraft
                                    neuron ]; }

{ pkgs, ... }:
let
  fs = pkgs.lib.fileset;
in
pkgs.hwinfo.overrideAttrs (old: {
  src = fs.toSource {
    root = ../.;
    fileset = fs.gitTracked ../.;
  };
})

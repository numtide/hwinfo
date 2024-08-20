{ pkgs, ... }:
let
  fs = pkgs.lib.fileset;
in
pkgs.hwinfo.overrideAttrs (old: {
  src = fs.toSource {
    root = ../.;
    fileset = fs.gitTracked ../.;
  };
  postPatch = (old.postPatch or "") + ''
    # hwinfo tries to create this to save log files.
    substituteInPlace Makefile \
      --replace-fail "/var/lib/hardware/udi" "$TMPDIR/udi"
  '';
  installFlags = [
    "INSTALL_PREFIX=$(out)" "ULIBDIR=$(out)/lib"
  ];
})

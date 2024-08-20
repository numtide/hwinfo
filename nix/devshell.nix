{ perSystem, ... }:
perSystem.self.default.overrideAttrs (old: {
  shellHook = ''
  '';
})

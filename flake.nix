{
  description = "Hardware information tool";

  # Add all your dependencies here
  inputs = {
    nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?shallow=1&ref=nixos-unstable";
    blueprint.url = "github:numtide/blueprint";
    blueprint.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Load the blueprint
  outputs =
    inputs:
    inputs.blueprint {
      inherit inputs;
      prefix = "nix/";
      systems = [
        "aarch64-linux"
        "riscv64-linux"
        "x86_64-linux"
      ];
    };
}

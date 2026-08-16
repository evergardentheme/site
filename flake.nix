{
  description = "evergarden site";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    ebil = {
      url = "git+https://codeberg.org/comfysage/ebil.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    whiskers = {
      url = "github:everviolet/whiskers";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
          system: function nixpkgs.legacyPackages.${system}
        );
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.callPackage ./nix/shell.nix { inherit inputs; };
      });
    };
}

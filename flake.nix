{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }@inputs:
    flake-utils.lib.eachSystem
      (with flake-utils.lib ;
      [ system.x86_64-linux system.aarch64-linux ])
      (system:
        let
          pkgs = (import nixpkgs) { inherit system; };
        in
        {
          packages =
            let
              blog = pkgs.callPackage ./default.nix { src = self; };
            in
            {
              blog = blog;
              default = blog;
            };
          devshells =
            let
              blog = pkgs.callPackage ./default.nix { src = self; };
            in
            {
              blog = blog;
              default = blog;
            };
        });
}

{
  description = "ARM64 Bootloader Dev Environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: {
    devShells = {
      x86_64-linux = let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        cross = pkgs.pkgsCross.aarch64-multiplatform;
      in {
        default = pkgs.mkShell {
          packages = [
            cross.buildPackages.gcc
            cross.buildPackages.binutils
            pkgs.qemu
            pkgs.gnumake
			pkgs.coreutils
          ];

          shellHook = ''
            echo "✅ ARM64 dev shell ready"
          '';
        };
      };
    };
  };
}

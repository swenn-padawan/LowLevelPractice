{
  description = "ARM64 Bootloader Dev Environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: {
    devShells = {
      x86_64-linux = let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        cross = pkgs.pkgsCross.aarch64-multiplatform.buildPackages;
      in {
        default = pkgs.mkShell {
          packages = [
            cross.gcc
            cross.binutils
            pkgs.qemu
            pkgs.gnumake
          ];

          shellHook = ''
            echo "✅ ARM64 dev shell ready"
          '';
        };
      };
    };
  };
}
